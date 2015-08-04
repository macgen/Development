//
//  UtilityFlipsideViewController.h
//  utility
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class UtilityFlipsideViewController;

@protocol UtilityFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(UtilityFlipsideViewController *)controller;
@end

@interface UtilityFlipsideViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) id <UtilityFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonEmail;
- (IBAction)sendEmail:(UIBarButtonItem *)sender;

@end
