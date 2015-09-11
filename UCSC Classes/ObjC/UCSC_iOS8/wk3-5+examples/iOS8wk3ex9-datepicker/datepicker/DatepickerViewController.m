//
//  DatepickerViewController.m
//  datepicker
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "DatepickerViewController.h"

@interface DatepickerViewController ()

@end

@implementation DatepickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Get today date
    NSDate *now =[NSDate date];
    
    // Assign date picker object to today's date
    [self.datePicker setDate:now animated:YES];

}

- (IBAction)button:(id)sender {
    // Store selected date from date picker into object
    NSDate *selected = [self.datePicker date];
    
    // Display a message in alert view
    NSString *message = [[NSString alloc] initWithFormat:@"Date and time selected is: %@", selected];
    
    // Create alert view
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and time selected" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Show alert view
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
