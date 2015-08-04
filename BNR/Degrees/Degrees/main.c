//
//  main.c
//  Degrees
//
//  Created by James on 3/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

//Declare a Gloabl Variable
float lastTemperature;

float fahrenheitFromCelcius(float cel)
{
    lastTemperature = cel;
    
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celcius is %f Fahrenheit\n", cel, fahr);
    
    return fahr;
}

int main(int argc, const char * argv[])
{
    float freezeInC = -40;
    float freezeInF = fahrenheitFromCelcius(freezeInC);
    
    printf("Water freezes at %f degrees Fahrenheit.\n", freezeInF);
    printf("The last temperature converted was %f.\n", lastTemperature);
    
    return EXIT_SUCCESS;
    
}
