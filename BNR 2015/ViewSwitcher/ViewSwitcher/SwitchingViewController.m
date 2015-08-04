//
//  ViewController.m
//  ViewSwitcher
//
//  Created by James Kim on 7/17/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "SwitchingViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@interface SwitchingViewController ()

@property (nonatomic, strong) YellowViewController *yellowViewController;
@property (nonatomic, strong) BlueViewController *blueViewController;

@end

@implementation SwitchingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    self.blueViewController.view.frame = self.view.frame;
    
    [self switchViewFromViewController:nil toViewController:self.blueViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (!self.blueViewController.view.superview)
    {
        self.blueViewController = nil;
    }
    else
    {
        self.yellowViewController = nil;
    }

}

- (IBAction) switchViews: (id) sender
{
    
    //Check if the current view controller is a yellow view controller...
    if (!self.yellowViewController)
    {
        self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
    }
    else
    {
        if (!self.blueViewController)
        {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
        }
    }
    
    //Switch Views...
    [UIView beginAnimations:@"View Flip" context: NULL];
    [UIView setAnimationDuration: 0.4];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    
    
    if (!self.yellowViewController.view.superview)
    {
        
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView: self.view cache: YES];
        
        self.yellowViewController.view.frame = self.view.frame;
        [self switchViewFromViewController: self.blueViewController toViewController:self.yellowViewController];
    }
    else
    {
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: self.view cache: YES];
        
        self.blueViewController.view.frame = self.view.frame;
        [self switchViewFromViewController: self.yellowViewController toViewController: self.blueViewController];
    }
    
    [UIView commitAnimations];
}

- (void) switchViewFromViewController: (UIViewController *) fromVC toViewController: (UIViewController *) toVC
{
    if (fromVC != nil)
    {
        [fromVC willMoveToParentViewController: nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }
    
    if (toVC != nil)
    {
        [self addChildViewController: toVC];
        [self.view insertSubview: toVC.view atIndex: 0];
        [toVC didMoveToParentViewController:self];
    }
    
}

@end
