#include "math_functions.h"

#include <cmath> 

#ifdef USE_MYMATH
#include "MySqrt/my_sqrt.h"
#endif

namespace mathfunctions {
    double sqrt(double x) {
    #ifndef USE_MYMATH   
        return std::sqrt(x);
    #else
        return mySqrt(x);
    #endif
    }
}


    