//
//  main.cpp
//  multiplyNumbers
//
//  Created by James Kim on 9/11/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream> 

int main()
{
    std::cout << "Please type in two numbers to multiply:  " << std::endl;
    
    int value1 = 0;
    int value2 = 0;
    
    std::cin >> value1 >> value2;
    std::cout << "Multiplying " << value1 << " and " << value2 << " equals " << value1 * value2 << "." << std::endl;
    return 0;
}