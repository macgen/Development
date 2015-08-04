//
//  ViewController.m
//  about
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
- (IBAction)pressWebSite:(id)sender
{
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.apple.com"]];
}

- (IBAction)pressYouTube:(id)sender
{
    UIApplication *myApplication = [UIApplication sharedApplication];
    NSString *youTube = @"http://www.youtube.com";
    NSURL *myURL = [NSURL URLWithString:youTube];
    
    [myApplication openURL: myURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
