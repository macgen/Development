//
//  main.cpp
//  Playground
//
//  Created by James Kim on 9/12/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <string>

using namespace std;

int main()
{
   //Playing with pointers..

    //Pointer that's constant can be changed...
    const int value = 5;
    const int *ptr = &value;
    
    const int anotherValue = 10;
    ptr = &anotherValue;
    
    std::cout << "Value of ptr: " << *ptr << std::endl;
    
    
    //Constant Pointers: Once set, you can't change the initial value..
    int value2 = 20;
    int value3 = 50;
    int *const anotherPointer = &value2;
    
    //anotherValue = &value3; - this can't be changed since its a Constant Pointer...
    
    std::cout << "Value of anotherPointer: " << *anotherPointer << std::endl;
    
    string s = "Hello World!";
    
    for (decltype(s.size()) index = 0)
    {
        
    }

    
    return 0;
}
