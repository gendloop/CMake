#include <iostream>
#include <string>

#include <config.h>

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

    const double value = stod(argv[1]);
#ifndef USE_MATH
    cout << "sqrt value: " << sqrt(value) << endl;
#else
    cout << "sqrt value: " << mysqrt(value) << endl;
#endif
    return 0;
}
