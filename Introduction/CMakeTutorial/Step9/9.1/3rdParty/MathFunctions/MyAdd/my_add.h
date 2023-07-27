#pragma once
#if defined(EXPORTING_MYADD)
    #define DECLSPEC_MYADD __declspec(dllexport)
#else
    #define DECLSPEC_MYADD __declspec(dllimport)
#endif

double DECLSPEC_MYADD myAdd(double a, double b);