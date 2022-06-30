// A simple program that computes the square root of a number
#include <cmath>
//#include <cstdlib>
#include <iostream>
#include <string>
#include "TutorialConfig.h"

int main(int argc, char* argv[])
{
  if (argc < 2) {
      
//#################### Step 1: A Basic Starting Point Begin ####################
    // 打印版本号
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
              << Tutorial_VERSION_MINOR << std::endl;
//##################### Step 1: A Basic Starting Point End #####################

    std::cout << "Usage: " << argv[0] << " number" << std::endl;
    return 1;
  }

  // convert input to double
  
//#################### Step 1: A Basic Starting Point Begin ####################
  //const double inputValue = atof(argv[1]);
  const double inputValue = std::stod(argv[1]);
//##################### Step 1: A Basic Starting Point End #####################

  // calculate square root
  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;
  return 0;
}
