//
//  BNRItem.h
//  RandomItems
//
//  Created by James Kim on 1/16/16.
//  Copyright © 2016 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+(instancetype) randomItem;

//Designated initializers for BNRItem
-(instancetype) initWithItemName: (NSString *) name
                  valueInDollars: (int) value
                    serialNumber: (NSString *) sNumber;

-(instancetype) initWIthItemName: (NSString *) name;


@end
