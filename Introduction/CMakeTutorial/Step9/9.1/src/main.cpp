// A simple program that computes the square root of a number
#include <iostream>
#include <sstream>
#include <string>

#include <math_functions.h>
#include "config.h"

int main(int argc, char* argv[])
{
  if (argc < 2) {
    // report version
    std::cout << argv[0] << " Version " << Step9_VERSION_MAJOR << "."
              << Step9_VERSION_MINOR << std::endl;
    std::cout << "Usage: " << argv[0] << " number" << std::endl;
    return 1;
  }

  // convert input to double
  const double inputValue = std::stod(argv[1]);

  const double outputValue = mathfunctions::sqrt(inputValue);

  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;

  if(argc >= 3) {
    double x = std::stod(argv[1]);
    double y = std::stod(argv[2]);
    const double add_value = mathfunctions::add(x, y);
    std::cout << "The add result of " << x << " and " << y << " is " << add_value
            << std::endl;
  }

  return 0;
}
