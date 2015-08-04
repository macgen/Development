//
//  ViewController.m
//  helloworld
//
//  Created by BESS HO on 1/20/15.
//  Copyright (c) 2015 BESS HO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create a frame for label
    CGRect LabelFrame = CGRectMake(0, 0, 320, 440);
    
    // Create a label object frame
    UILabel *label = [[UILabel alloc] initWithFrame:LabelFrame];
    
    // Assign a string to label text
    label.text = @"Hello World";
    
    // Set view background to orange
    self.view.backgroundColor = [UIColor orangeColor];
    
    // Align label
    label.textAlignment = NSTextAlignmentCenter;
    
    // Add label to view
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
