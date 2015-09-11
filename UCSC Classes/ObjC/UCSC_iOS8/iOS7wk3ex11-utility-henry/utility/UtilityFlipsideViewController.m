//
//  UtilityFlipsideViewController.m
//  utility
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "UtilityFlipsideViewController.h"
#import "UtilityDataKeys.h"

@interface UtilityFlipsideViewController ()

@end

@implementation UtilityFlipsideViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)sendEmail:(UIBarButtonItem *)sender {
    // Get saved data
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *udid = [self.messenger objectForKey:TransferDictionaryDataKey];
    NSString *type = [self.messenger objectForKey:TransferDictionaryTypeKey];
    NSLog(@"Retrieve UDID to FlipViewController %@", udid);
    
    NSString *subject = @"Device ID";
    // Adding string to another string
    NSString *body = [NSString stringWithFormat:@"%@ is %@", type, udid];
    NSArray *to = [NSArray arrayWithObject:@"bessho@ucsc.edu"];
    
    // Create built-in MFMailComposeViewController w standard interface
    // Standard email view inside your app
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setMessageBody:body isHTML:NO];
    [mc setToRecipients:to];
    
    // Display email view
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // Close email view
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
