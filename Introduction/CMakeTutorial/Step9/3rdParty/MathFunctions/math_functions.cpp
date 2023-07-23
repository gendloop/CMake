#include "math_functions.h"

double mySqrt(double x) {
    if(x <= 0) {
        return 0;
    }

    double ret = x;
    /**
     * f(x) = x, f(x) = x^2
        => x^2 - x = 0
        => x_{n+1} = x_n - f(x)/f'(x)
        => x_{n+1} = x_n - (x_n^2-x_n) / (2x_n - 1)
        => x_{n+1} = x_n + (x_n - x_n^2) / (2x_n - 1)
     */
    double count = 10;
    for(int i = 0; i < count; ++i) {
        if(ret <= 0) {
            ret = 0.01;
        }
        double delta = x - (ret * ret);
        ret = ret + delta / (2. * ret - 1);
    }
}