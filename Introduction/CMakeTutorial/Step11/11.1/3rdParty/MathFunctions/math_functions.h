#pragma once
#include <iostream>

#ifdef EXPORT
#define EXPORT_API __declspec(dllexport)
#else
#define EXPORT_API __declspec(dllimport)
#endif

namespace mathfunctions{
    double EXPORT_API sqrt(double x);
    double EXPORT_API add(double x, double y);
}
