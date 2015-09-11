//
//  CamplightSecondViewController.h
//  camplight
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CamplightSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barbuttonCampus;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barbuttonCourse;
- (IBAction)showCampus:(UIBarButtonItem *)sender;
- (IBAction)showCourse:(UIBarButtonItem *)sender;

@end
