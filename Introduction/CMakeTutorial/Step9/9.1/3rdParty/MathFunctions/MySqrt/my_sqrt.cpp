#include "my_sqrt.h"

double mySqrt(double x) {
    if(x <= 0) {
        return 0;
    }

    double ret = x;
    /**
     * f(ret) - x = ret^2 - x = 0
        ret_next = ret - (ret^2 - x) / 2*ret = ret + (x - ret^2) / 2*ret
     */
    double count = 10;
    for(int i = 0; i < count; ++i) {
        if(ret <= 0) {
            ret = 0.01;
        }
        double delta = x - (ret * ret);
        ret = ret + delta / (2. * ret);
        std::cout << "Sqrt of " << x << " is " << ret << std::endl;
    }
    return ret;
}
