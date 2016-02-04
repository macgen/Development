//
//  main.m
//  RandomItems
//
//  Created by James Kim on 1/16/16.
//  Copyright © 2016 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
//        //Create 10 random objects
//        for (int i = 0; i < 10; i++)
//        {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject: item];
//        }
        
        BNRItem *backpack = [[BNRItem alloc] initWIthItemName:@"Backpack"];
        [items addObject: backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWIthItemName:@"Calculator"];
        [items addObject: calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        //Print the objects in the array
        for (BNRItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        
        //Destroy the mutable array object
        NSLog(@"Setting items to nil...");
        items = nil;
        
    }
    
    return 0;
}
