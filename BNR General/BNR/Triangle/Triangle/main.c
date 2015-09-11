//
//  main.c
//  Triangle
//
//  Created by James on 3/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

float remainingAngle(float angleA, float angleB)
{
    float remainAngle = 180.00 - angleA - angleB;
    
    return remainAngle;
    
}
int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    
    printf("The third angle is %.2f\n", angleC);
    
    return 0;

}
