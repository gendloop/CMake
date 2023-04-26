#include <iostream>
#include <cmath>

int main(int argc, char* argv[]) {
    if(argc < 2) {
        std::cout << "Usage: " << argv[0] << " number" << std::endl;
        return 1;
    }

    // => double 
    const double input_value = atof(argv[1]);
    std::cout 
        << "The square root of " << input_value 
        << " is " << sqrt(input_value)
        << std::endl;

    return 0;
}