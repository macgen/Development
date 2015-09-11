//
//  ActionsheetViewController.m
//  actionsheet
//
//  Created by BESS HO on 12/28/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "ActionsheetViewController.h"

@interface ActionsheetViewController ()

@end

@implementation ActionsheetViewController

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
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Hello"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:@"Order"
                                  otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@"Order"])
    {
        NSLog(@"Order is selected");
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
    else if ([title isEqualToString:@"Cancel"]) {
        NSLog(@"Cancel button is selected");
    }
}

@end
