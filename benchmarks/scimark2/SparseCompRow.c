#include <stdlib.h>
#include <assert.h>

#include "jnt_scimark2_SparseCompRow.h"

/* multiple iterations used to make kernel have roughly
        same granulairty as other Scimark kernels. */

    double SparseCompRow_num_flops(int N, int nz, int num_iterations)
    {
        /* Note that if nz does not divide N evenly, then the
           actual number of nonzeros used is adjusted slightly.
        */
        int actual_nz = (nz/N) * N;
        return ((double)actual_nz) * 2.0 * ((double) num_iterations);
    }


    /* computes  a matrix-vector multiply with a sparse matrix
        held in compress-row format.  If the size of the matrix
        in MxN with nz nonzeros, then the val[] is the nz nonzeros,
        with its ith entry in column col[i].  The integer vector row[]
        is of size M+1 and row[i] points to the begining of the
        ith row in col[].  
    */

    void SparseCompRow_matmult( int M, double *y, double *val, int *row,
        int *col, double *x, int NUM_ITERATIONS)
    {
        int reps;
        int r;
        int i;

        for (reps=0; reps<NUM_ITERATIONS; reps++)
        {
        
            for (r=0; r<M; r++)
            {
                double sum = 0.0; 
                int rowR = row[r];
                int rowRp1 = row[r+1];
                for (i=rowR; i<rowRp1; i++)
                    sum += x[ col[i] ] * val[i];
                y[r] += sum;
            }
        }
    }

JNIEXPORT void JNICALL Java_jnt_scimark2_SparseCompRow_JniMatmult(JNIEnv* env, jobject obj, jdoubleArray yArr, jdoubleArray valArr, jintArray rowArr, jintArray colArr, jdoubleArray xArr, jint NUM_ITERATIONS)
{
    jsize M = (*env)->GetArrayLength(env, rowArr) - 1;
    jsize yLen = (*env)->GetArrayLength(env, yArr);
    double* y = (double*)malloc(yLen * sizeof(double));
    assert(y != NULL);
    (*env)->GetDoubleArrayRegion(env, yArr, 0, yLen, y);
    jsize valLen = (*env)->GetArrayLength(env, valArr);
    double* val = (double*)malloc(valLen * sizeof(double));
    assert(val != NULL);
    (*env)->GetDoubleArrayRegion(env, valArr, 0, valLen, val);
    jsize rowLen = (*env)->GetArrayLength(env, rowArr);
    int* row = (int*)malloc(rowLen * sizeof(int));
    assert(row != NULL);
    (*env)->GetIntArrayRegion(env, rowArr, 0, rowLen, row);
    jsize colLen = (*env)->GetArrayLength(env, colArr);
    int* col = (int*)malloc(colLen * sizeof(int));
    assert(col != NULL);
    (*env)->GetIntArrayRegion(env, colArr, 0, colLen, col);
    jsize xLen = (*env)->GetArrayLength(env, xArr);
    double* x = (double*)malloc(xLen * sizeof(double));
    assert(x != NULL);
    (*env)->GetDoubleArrayRegion(env, xArr, 0, xLen, x);
    SparseCompRow_matmult(M, y, val, row, col, x, NUM_ITERATIONS);
    (*env)->SetDoubleArrayRegion(env, yArr, 0, yLen, y);
    free(y);
    free(val);
    free(row);
    free(col);
    free(x);
}
