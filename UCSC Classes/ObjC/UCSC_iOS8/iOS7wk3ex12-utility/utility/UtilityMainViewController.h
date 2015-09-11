//
//  UtilityMainViewController.h
//  utility
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "UtilityFlipsideViewController.h"
#import <AdSupport/AdSupport.h>

@interface UtilityMainViewController : UIViewController <UtilityFlipsideViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (weak, nonatomic) IBOutlet UILabel *udidLabel;

- (IBAction)selectedSegmented:(id)sender;

@end
