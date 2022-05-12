#include<stdio.h>
#include<math.h>

int main(){

    int M = 8; // define dimension of the matrix
    double a[M-1], b[M-1], c[M-1];

    double theta_1 = 0.6;
    double theta_2 = 0.5;

    // initialize the vector a, b, c
    for (int i = 0; i < M-1; i++){
        a[i] = -2 - 2 * (theta_1 * (i+1)) / M;
    }

    for (int i=0;i<M-1; i++){
        b[i] = 1 + (theta_1 * ((i+1)-0.5)) / M;      
    }

    for (int i=0; i< M-1; i++){
        c[i] = 1 + (theta_1 * ((i+1) + 0.5)) / M;
    }
    

    double alpha[M-1], beta[M-1];
    alpha[0] = a[0];
    for (int i = 1; i < M-1; i++){
        beta[i] = b[i] / alpha[i-1];
        alpha[i] = a[i] - (beta[i] * c[i-1]); 
    }

    double f = -50 * theta_2 * theta_2;
    double y[M-1];
    y[0] = f;
    for (int i=1; i < M-1; i++){
        y[i] = f - beta[i] * y[i-1];
    } 

    double u[M-1];
    u[M-2] = y[M-2] / alpha[M-2];
    for (int i = M-3; i >= 0 ; i--){
        u[i] = (y[i] / alpha[i]) - (c[i] * ( u[i+1] / alpha[i]));
    }

    double dx = 1. / M;
    double p = 0.0;
    for (int i = 0; i< M-1 ;i++){
        p = p + u[i] * dx;
    }

    printf("%lf \n",p);

    return 0;
}