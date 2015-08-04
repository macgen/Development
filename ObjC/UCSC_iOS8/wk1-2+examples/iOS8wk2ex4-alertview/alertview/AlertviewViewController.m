//
//  AlertviewViewController.m
//  alertview
//
//  Created by BESS HO on 12/28/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "AlertviewViewController.h"

@interface AlertviewViewController ()

@end

@implementation AlertviewViewController

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

- (IBAction)showMessage:(id)sender {
    UIAlertView *message = [[UIAlertView alloc]
                            initWithTitle:@"Hello"
                            message:@"This is a Message"
                            delegate:self
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil];
    [message show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@"OK"]) {
        NSLog(@"OK is selected");
    }
    else if ([title isEqualToString:@"Button 1"])
    {
        NSLog(@"Button 1 is selected");
    }
    else if ([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 is selected");
    }
    else if ([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 is selected");
    }
}

@end
