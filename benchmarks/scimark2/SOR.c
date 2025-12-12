#include <stdlib.h>
#include <assert.h>

#include "jnt_scimark2_SOR.h"

    double SOR_num_flops(int M, int N, int num_iterations)
    {
        double Md = (double) M;
        double Nd = (double) N;
        double num_iterD = (double) num_iterations;

        return (Md-1)*(Nd-1)*num_iterD*6.0;
    }

    void SOR_execute(int M, int N, double omega, double **G, int 
            num_iterations)
    {

        double omega_over_four = omega * 0.25;
        double one_minus_omega = 1.0 - omega;

        /* update interior points */

        int Mm1 = M-1;
        int Nm1 = N-1; 
        int p;
        int i;
        int j;
        double *Gi;
        double *Gim1;
        double *Gip1;

        for (p=0; p<num_iterations; p++)
        {
            for (i=1; i<Mm1; i++)
            {
                Gi = G[i];
                Gim1 = G[i-1];
                Gip1 = G[i+1];
                for (j=1; j<Nm1; j++)
                    Gi[j] = omega_over_four * (Gim1[j] + Gip1[j] + Gi[j-1] 
                                + Gi[j+1]) + one_minus_omega * Gi[j];
            }
        }
    }
            
JNIEXPORT void JNICALL Java_jnt_scimark2_SOR_JniExecute(JNIEnv* env, jobject obj, jdouble omega, jobjectArray arr, jint num_iterations)
{
    jsize M = (*env)->GetArrayLength(env, arr);
    double** G = (double**)malloc(M * sizeof(double*));
    assert(G != NULL);
    jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, arr, 0);
    jsize N = (*env)->GetArrayLength(env, rowArray);
    (*env)->DeleteLocalRef(env, rowArray);
    jsize i;
    jboolean isCopy;
    for (i = 0; i < M; i++) {
        jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, arr, i);
        assert(rowArray != NULL);
        G[i] = (*env)->GetDoubleArrayElements(env, rowArray, &isCopy);
        (*env)->DeleteLocalRef(env, rowArray);
    }
    SOR_execute(M, N, omega, G, num_iterations);
    for (i = 0; i < M; i++) {
        if (G[i]) {
            jdoubleArray rowArray = (jdoubleArray)(*env)->GetObjectArrayElement(env, arr, i);
            (*env)->ReleaseDoubleArrayElements(env, rowArray, G[i], 0);
            (*env)->DeleteLocalRef(env, rowArray);
        }
    }
    free(G);
    G = NULL;
}
