//
//  CampfireViewController.m
//  campfire
//
//  Created by BESS HO on 12/28/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "CampfireViewController.h"

@interface CampfireViewController ()

@end

@implementation CampfireViewController

- (void)viewDidLoad
{
    // It's optional to leave [super viewDidLoad]
    [super viewDidLoad];
    
    // Hide Status Bar
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
    // Create an image view object using the entire view's frame of the viewController
    UIImageView* fireView = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    // Add an array of images into image view's animation property
    fireView.animationImages = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"campFire01.gif"],
                                [UIImage imageNamed:@"campFire02.gif"],
                                [UIImage imageNamed:@"campFire03.gif"],
                                [UIImage imageNamed:@"campFire04.gif"],
                                [UIImage imageNamed:@"campFire05.gif"],
                                [UIImage imageNamed:@"campFire06.gif"],
                                [UIImage imageNamed:@"campFire07.gif"],
                                [UIImage imageNamed:@"campFire08.gif"],
                                [UIImage imageNamed:@"campFire09.gif"],
                                [UIImage imageNamed:@"campFire10.gif"],
                                [UIImage imageNamed:@"campFire11.gif"],
                                [UIImage imageNamed:@"campFire12.gif"],
                                [UIImage imageNamed:@"campFire13.gif"],
                                [UIImage imageNamed:@"campFire14.gif"],
                                [UIImage imageNamed:@"campFire15.gif"],
                                [UIImage imageNamed:@"campFire16.gif"],
                                [UIImage imageNamed:@"campFire17.gif"], nil];
    
    // Assign the animation duration in seconds
    fireView.animationDuration = 2.00;
    
    // Repeat animation indefinitely
    fireView.animationRepeatCount = 0;
    
    // Start animating image view
    [fireView startAnimating];
    
    // Add the image view object to the ViewController's view
    [self.view addSubview:fireView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
