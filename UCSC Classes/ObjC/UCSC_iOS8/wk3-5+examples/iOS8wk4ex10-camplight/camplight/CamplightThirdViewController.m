//
//  CamplightThirdViewController.m
//  camplight
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "CamplightThirdViewController.h"

@interface CamplightThirdViewController ()

@end

@implementation CamplightThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load PDF Content into WebView
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"iphone_user_guide" ofType:@"pdf"];
    if (thePath) {
        NSData *pdfData = [NSData dataWithContentsOfFile:thePath];
        [self.webviewPDF loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
