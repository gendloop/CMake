#include <iostream>
#include <string>

#include <config.h>

// 3rdParty
#include "MathFunctions.h"

int main(int argc, char* argv[]) {
    using namespace std;

    cout << argv[0] << endl;
    cout << "VERSION_MAJOR: " << VERSION_MAJOR << endl;
    cout << "VERSION_MINOR: " << VERSION_MINOR << endl;

    if(argc < 2) {
        return 1;
    }

    const double value = stod(argv[1]);
    cout << "sqrt value 1: " << sqrt(value) << endl;
    cout << "sqrt value 2: " << mysqrt(value) << endl;

    return 0;
}
