#include <iostream>
#include <string>

#include <config.h>

#include "a_table.h"

// 3rdParty
#ifdef USE_MATH
    #include <MathFunctions.h>
#endif

int main(int argc, char* argv[]) {
    using namespace std;

    cout << argv[0] << endl;
    cout << "VERSION_MAJOR: " << VERSION_MAJOR << endl;
    cout << "VERSION_MINOR: " << VERSION_MINOR << endl;    
    
    if(argc < 2) {
        return 0;
    }

    const double value = atof(argv[1]);
    //std::cout << "No matter what you input, it is always eq to 0" << std::endl;
#ifndef USE_MATH
    cout << "sqrt value: " << sqrt(value) << endl;
#else
    cout << "sqrt value: " << mysqrt(value) << endl;
#endif
    return 0;
}