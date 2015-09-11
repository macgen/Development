//
//  AboutViewController.m
//  about
//
//  Created by BESS HO on 12/26/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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

// Open Website on Safari Browser App
- (IBAction)pressWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.ucsc-extension.edu"]];
}

// Open a youtube on Safari Browser App
- (IBAction)pressYoutube:(id)sender {
    UIApplication *ourApplication = [UIApplication sharedApplication];
    NSString *ourPath = @"http://www.youtube.com/watch?v=v1uyQZNg2vE";
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    [ourApplication openURL:ourURL];
}

@end
