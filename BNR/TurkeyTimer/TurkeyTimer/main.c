//
//  main.c
//  TurkeyTimer
//
//  Created by James on 3/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

void showCookTimeForTurkey(int pounds)
{
    int necessaryMinutes = 15 + 15 * pounds;
    
    printf("Cook for %d minutes.\n", necessaryMinutes);
    
    if (necessaryMinutes > 120)
    {
        int halfWay = necessaryMinutes / 2;
        printf("Rotate after %d of the %d mintues.\n", halfWay, necessaryMinutes);
    }
}

int main(int argc, const char * argv[])
{
    int totalWeight = 10;
    int gibletWeight = 1;
    int turkeyWeight = totalWeight - gibletWeight;
    showCookTimeForTurkey(turkeyWeight);
    
    return 0;
    
}
