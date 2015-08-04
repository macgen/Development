//
//  ViewController.h
//  ToDoList
//
//  Created by James on 2/8/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) NSString *myName;

-(NSString *) myMethod: (NSString *) someString anotherParam: (NSString *) anotherString;

-(NSArray *) myArrayMethod: (NSArray *) firstArray secondArray: (NSArray *) secondArray;

@end

