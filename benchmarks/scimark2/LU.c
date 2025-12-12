#include <math.h>
#include <stdlib.h>
#include <assert.h>

#include "jnt_scimark2_LU.h"

double LU_num_flops(int N)
{
        /* rougly 2/3*N^3 */

    double Nd = (double) N;

    return (2.0 * Nd *Nd *Nd/ 3.0);
}


void LU_copy_matrix(int M, int N, double **lu, double **A)
{
    int i;
    int j;

    for (i=0; i<M; i++)
        for (j=0; j<N; j++)
            lu[i][j] = A[i][j];
}


int LU_factor(int M, int N, double **A,  int *pivot)
{
 

    int minMN =  M < N ? M : N;
    int j=0;

    for (j=0; j<minMN; j++)
    {
        /* find pivot in column j and  test for singularity. */

        int jp=j;
        int i;
        
        double t = fabs(A[j][j]);
        for (i=j+1; i<M; i++)
        {
            double ab = fabs(A[i][j]);
            if ( ab > t)
            {
                jp = i;
                t = ab;
            }
        }
        
        pivot[j] = jp;

        /* jp now has the index of maximum element  */
        /* of column j, below the diagonal          */

        if ( A[jp][j] == 0 )                 
            return 1;       /* factorization failed because of zero pivot */


        if (jp != j)
        {
            /* swap rows j and jp */
            double *tA = A[j];
            A[j] = A[jp];
            A[jp] = tA;
        }

        if (j<M-1)                /* compute elements j+1:M of jth column  */
        {
            /* note A(j,j), was A(jp,p) previously which was */
            /* guarranteed not to be zero (Label #1)         */

            double recp =  1.0 / A[j][j];
            int k;
            for (k=j+1; k<M; k++)
                A[k][j] *= recp;
        }


        if (j < minMN-1)
        {
            /* rank-1 update to trailing submatrix:   E = E - x*y; */
            /* E is the region A(j+1:M, j+1:N) */
            /* x is the column vector A(j+1:M,j) */
            /* y is row vector A(j,j+1:N)        */

            int ii;
            for (ii=j+1; ii<M; ii++)
            {
                double *Aii = A[ii];
                double *Aj = A[j];
                double AiiJ = Aii[j];
                int jj;
                for (jj=j+1; jj<N; jj++)
                  Aii[jj] -= AiiJ * Aj[jj];

            }
        }
    }

    return 0;
}

JNIEXPORT void JNICALL Java_jnt_scimark2_LU_JniFactor(JNIEnv* env, jobject obj, jobjectArray AArr, jintArray pivotArr)
{
    jsize M = (*env)->GetArrayLength(env, AArr);
    double** A = (double**)malloc(M * sizeof(double*));
    assert(A != NULL);
    jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, AArr, 0);
    jsize N = (*env)->GetArrayLength(env, rowArray);
    (*env)->DeleteLocalRef(env, rowArray);
    jsize i;
    jboolean isCopy;
    for (i = 0; i < M; i++) {
        jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, AArr, i);
        assert(rowArray != NULL);
        A[i] = (*env)->GetDoubleArrayElements(env, rowArray, &isCopy);
        (*env)->DeleteLocalRef(env, rowArray);
    }
    jsize pivotLen = (*env)->GetArrayLength(env, pivotArr);
    int* pivot = (int*)malloc(pivotLen * sizeof(int));
    assert(pivot != NULL);
    (*env)->GetIntArrayRegion(env, pivotArr, 0, pivotLen, pivot);
    LU_factor(M, N, A, pivot);
    for (i = 0; i < M; i++) {
        if (A[i]) {
            jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, AArr, i);
            (*env)->ReleaseDoubleArrayElements(env, rowArray, A[i], 0);
            (*env)->DeleteLocalRef(env, rowArray);
        }
    }
    free(A);
    A = NULL;
    free(pivot);
    pivot = NULL;
}
