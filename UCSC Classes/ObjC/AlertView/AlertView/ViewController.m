//
//  ViewController.m
//  AlertView
//
//  Created by James on 1/29/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showMessage:(id)sender
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"This is a message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Button 1",@"Button 2", @"Button 3", nil];
    [message show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
