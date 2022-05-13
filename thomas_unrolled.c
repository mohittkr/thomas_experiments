#include<stdio.h>
#include<math.h>

int main(){

    double t_1 = 0.6;
    double t_2 = 0.5;

    double a_1 = -2 - 2 * (t_1 * 1) / 4;
    double a_2 = -2 - 2 * (t_1 * 2) / 4;
    double a_3 = -2 - 2 * (t_1 * 3) / 4;
    double b_2 = 1 + (t_1 * 1.5) / 4;
    double b_3 = 1 + (t_1 * 2.5) / 4;
    double c_1 = 1 + (t_1 * 1.5) / 4;
    double c_2 = 1 + (t_1 * 2.5) / 4;

    double alpha_1 = a_1;
    double beta_2 = b_2 / alpha_1;
    double alpha_2 = a_2 - beta_2 * c_1;
    double beta_3 = b_3 / alpha_2;
    double alpha_3 = a_3 - beta_3 * c_2;

    double f = -50 * t_2 * t_2;

    double y_1 = f;
    double y_2 = f - beta_2 * y_1;
    double y_3 = f - beta_3 * y_2;

    double u_3 = y_3 / alpha_3;
    double u_2 = y_2 / alpha_2 - c_2 * (u_3 / alpha_2);
    double u_1 = y_1 / alpha_1 - c_1 * (u_2 / alpha_1);
    double p = u_1/ 4 + u_2/ 4 +  u_3 / 4;

    printf("%lf\n", p);
    printf("%lf\n", a_1);
    printf("%lf\n", a_2);
    printf("%lf\n", a_3);
    printf("%lf\n", b_2);
    printf("%lf\n", b_3);
    printf("%lf\n", c_1);
    printf("%lf\n", c_2);
    printf("%lf\n", alpha_1);
    printf("%lf\n", alpha_2);
    printf("%lf\n", alpha_3);
    printf("%lf\n", beta_2);
    printf("%lf\n", beta_3);
    


    return 0;
}