//
//  AlertviewViewController.h
//  alertview
//
//  Created by BESS HO on 12/28/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertviewViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *Button;

- (IBAction)showMessage:(id)sender;

@end
