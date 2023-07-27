#pragma once
#include <iostream>

#if defined(EXPORTING_MYSQRT)
    #define DECLSPEC_MYSQRT __declspec(dllexport)
#else
    #define DECLSPEC_MYSQRT __declspec(dllimport)
#endif

double DECLSPEC_MYSQRT mySqrt(double x);