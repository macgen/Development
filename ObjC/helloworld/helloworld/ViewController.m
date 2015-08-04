//
//  ViewController.m
//  helloworld
//
//  Created by James on 1/22/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create a frame for the label...
    CGRect labelFrame = CGRectMake(0, 0, 320, 440);
    
    //Instantiate a label...
    UILabel *label = [[UILabel alloc] initWithFrame: labelFrame];
    
    //Assign a string to the label...
    label.text = @"Hello World!";

    //Change the view background...
    self.view.backgroundColor = [UIColor orangeColor];
    

    
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview: label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
