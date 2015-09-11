//
//  AboutViewController.h
//  about
//
//  Created by BESS HO on 12/26/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonWebsite;
@property (weak, nonatomic) IBOutlet UIButton *buttonYoutube;

- (IBAction)pressWebsite:(id)sender;
- (IBAction)pressYoutube:(id)sender;

@end
