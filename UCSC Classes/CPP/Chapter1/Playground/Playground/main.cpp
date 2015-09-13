//
//  main.cpp
//  Playground
//
//  Created by James Kim on 9/12/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>

int main()
{
    //read in multiple numbers from a user input and compare if their numbers repeat..
    
    int currentNumber = 0;
    int nextNumber = 0;
    
    //verify that we have a number first to start...
    if (std::cin >> currentNumber)
    {
        //every number occurs atleast once...
        int count = 1;
        
        //now that we have a fist value, check the next number to see if its the same as the previous number...
        //keep going until there is no more number of eof
        while (std::cin >> nextNumber)
        {
            //if the secon number matches the first number.. increment the count...
            if (currentNumber == nextNumber)
            {
                //increment the count...
                count++;
            }
            else
            {
                std::cout << currentNumber << " occured: " << count << " times." << std::endl;
                
                //next number no longer matches so go on...
                currentNumber = nextNumber;
                count = 1;
                
                
            }
        }
        
        std::cout << currentNumber << " occured: " << count << " times." << std::endl;
        
    }
    
    return 0;
}
