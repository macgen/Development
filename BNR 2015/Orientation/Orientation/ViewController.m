//
//  ViewController.m
//  Orientation
//
//  Created by James Kim on 7/17/15.
//  Copyright © 2015 James. All rights reserved.
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger) supportedInterfaceOrientation
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end
