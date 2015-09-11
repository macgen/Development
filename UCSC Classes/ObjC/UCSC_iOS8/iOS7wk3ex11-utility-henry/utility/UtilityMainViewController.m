//
//  UtilityMainViewController.m
//  utility
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "UtilityMainViewController.h"
#import "UtilityDataKeys.h"

@interface UtilityMainViewController () <UtilityFlipsideViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (weak, nonatomic) IBOutlet UILabel            *udidLabel;

@property (strong, nonatomic)        NSDictionary       *messenger;

@end

@implementation UtilityMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Load Vendor Identifier similar to UIDevice UDID
    // [UIDevice currentDevice].identifierForVendor.UUIDString
    
    NSString  *udidData = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString  *udidType = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    self.messenger = @{
                       TransferDictionaryDataKey : udidData,
                       TransferDictionaryTypeKey : udidType
                    };
    
    self.udidLabel.text = udidData;
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
        [[segue destinationViewController] setMessenger:self.messenger];
    }
}

- (IBAction)selectedSegmented:(id)sender
{
    NSString  *udidData = nil;
    NSString  *udidType = nil;
    
    if (self.segmented.selectedSegmentIndex == 0) {
        // Using NSUUID class
        udidData = [[NSUUID UUID] UUIDString];
        udidType = UniqueIdentifierNSUUId;
        NSLog(@"First UUID using NSUUID class: %@", udidData);
        NSLog(@"First data saved");
    } else if (self.segmented.selectedSegmentIndex == 1) {
        // Using UIDevice class
        udidData = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        udidType = UniqueIdentifierVendor;
        NSLog(@"Second identifierForVendor UUID using UIDevice class: %@", udidData);
        NSLog(@"Second data saved");
    } else if (self.segmented.selectedSegmentIndex == 2) {
        // Using ASIdentifierManager class using AdSupport framework
        NSUUID *UUID = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        udidData = [UUID UUIDString];
        udidType = UniqueIdentifierAdvert;
        NSLog(@"Third advertisingIdentifier UUID using AdSupport Framework: %@", udidData);
        NSLog(@"Third data saved");
    }
    self.messenger = @{
                       TransferDictionaryDataKey : udidData,
                       TransferDictionaryTypeKey : udidType
                       };
    self.udidLabel.text = udidData;
}

@end
