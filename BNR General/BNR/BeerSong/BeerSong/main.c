//
//  main.c
//  BeerSong
//
//  Created by James on 3/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

void singSongFor(int numberOfBottles)
{
    if (numberOfBottles == 0)
    {
        printf("There are simply no more bottles of beer on the wall.\n\n");
    }
    else
    {
        printf ("%d bottles of beer on the wall, %d bottles of beer.\n", numberOfBottles, numberOfBottles);
        
        int oneFewer = numberOfBottles - 1;
        
        printf("Take one down, pass it around, %d bottles of beer on the wall.\n", oneFewer);
        
        singSongFor(oneFewer);
        
        //Print the message just before the function ends
        printf("Put a bottle in the recycling, %d empty bottles of in the bin.\n", numberOfBottles);
               
        
    }
}
int main(int argc, const char * argv[])
{
    singSongFor(4);
    
    return 0;
    
}
