//
//  CamplightSecondViewController.m
//  camplight
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "CamplightSecondViewController.h"

@interface CamplightSecondViewController ()

@end

@implementation CamplightSecondViewController

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

- (IBAction)showCampus:(UIBarButtonItem *)sender {
    NSString *campus = @"UCSC Extension Silicon Valley \n2505 Augustine Drive, Suite 100. Santa Clara, CA 95054 \nTel: (408) 861-3700";
    self.textview.text = campus;
}

- (IBAction)showCourse:(UIBarButtonItem *)sender {
    // Create file path in NSString
    NSString *path = [[NSBundle mainBundle] pathForResource:@"course" ofType:@"txt"];
    // Encode file content
    NSString *filecontent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    // Show file path in log
    NSLog(@"file path: %@", path);
    // Load file content into text view text property
    self.textview.text = filecontent;
}

@end
