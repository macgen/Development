//
//  UtilityMainViewController.m
//  utility
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "UtilityMainViewController.h"

@interface UtilityMainViewController ()

@end

@implementation UtilityMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Load Vendor Identifier similar to UIDevice UDID
    // [UIDevice currentDevice].identifierForVendor.UUIDString
    NSString *udid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    self.udidLabel.text = udid;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View
- (void)flipsideViewControllerDidFinish:(UtilityFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (IBAction)selectedSegmented:(id)sender {
    if (self.segmented.selectedSegmentIndex == 0) {
        // Using NSUUID class
        NSString *udid = [[NSUUID UUID] UUIDString];
        self.udidLabel.text = udid;
        NSString *udidType = @"NSUUID UUID";
        NSLog(@"First UUID using NSUUID class: %@", udid);
        
        // Save UDID in user defaults
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:udid forKey:@"UDID"];
        [user setObject:udidType forKey:@"type"];
        [user synchronize];
        NSLog(@"First data saved");
    }
    
    if (self.segmented.selectedSegmentIndex == 1) {
        // Using UIDevice class
        NSString *udid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        self.udidLabel.text = udid;
        NSString *udidType = @"identifierForVendor UUID";
        NSLog(@"Second identifierForVendor UUID using UIDevice class: %@", udid);
        
        // Save UDID in user defaults
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:udid forKey:@"UDID"];
        [user setObject:udidType forKey:@"type"];
        [user synchronize];
        NSLog(@"Second data saved");
    }
    
    if (self.segmented.selectedSegmentIndex == 2) {
        // Using ASIdentifierManager class using AdSupport framework
        NSUUID *UUID = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        NSString *udid = [UUID UUIDString];
        self.udidLabel.text = udid;
        NSString *udidType = @"advertisingIdentifier UUID";
        NSLog(@"Third advertisingIdentifier UUID using AdSupport Framework: %@", udid);
        
        // Save UDID in user defaults
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:udid forKey:@"UDID"];
        [user setObject:udidType forKey:@"type"];
        [user synchronize];
        NSLog(@"Third data saved");
    }
}
@end
