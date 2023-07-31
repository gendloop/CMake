#include "math_functions.h"

#include <cmath> 

#ifdef USE_MYMATH
#include <my_sqrt.h>
#include <my_add.h>
#endif

namespace mathfunctions {
    double sqrt(double x) {
    #ifndef USE_MYMATH   
        return std::sqrt(x);
    #else
        return mySqrt(x);
    #endif
    }

    double add(double x, double y) {
        #ifndef USE_MYMATH
            return x+y;
        #else
            return myAdd(x, y);
        #endif
    }
}


    