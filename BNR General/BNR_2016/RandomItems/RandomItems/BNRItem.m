//
//  BNRItem.m
//  RandomItems
//
//  Created by James Kim on 1/16/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+(instancetype) randomItem
{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nounds
    NSArray *randomNounList = @[@"Bear", @"SporK", @"Mac"];
    
    //Get the index of a random adjective/noun from the lists
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    //NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex: adjectiveIndex], [randomNounList objectAtIndex: nounIndex]];
    NSString *randomName = [NSString stringWithFormat: @"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10,
                                                                             'A' + arc4random() % 26,
                                                                             '0' + arc4random() % 10,
                                                                             'A' + arc4random() % 26,
                                                                             '0' + arc4random() % 10];
    BNRItem *newItem = [[self alloc] initWithItemName: randomName valueInDollars: randomValue serialNumber: randomSerialNumber];
    
    return newItem;
}

-(instancetype) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    //call the superclass's designated initializers
    self = [super init];
    
    //did the superclass's initializer succeed ?
    if (self)
    {
        //Give the instance varibales initial values
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        
        //set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

-(instancetype) initWIthItemName:(NSString *)name
{
    return [self initWithItemName: name valueInDollars: 0 serialNumber: @""];
}

-(instancetype) init
{
    return [self initWIthItemName:@"Item"];
}

-(void) setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

-(NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    
    return descriptionString;
}




-(void) dealloc
{
    NSLog(@"Destroyed %@", self);
}

@end
