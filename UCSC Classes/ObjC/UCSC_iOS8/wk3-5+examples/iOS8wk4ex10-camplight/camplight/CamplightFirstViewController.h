//
//  CamplightFirstViewController.h
//  camplight
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CamplightFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *switchOnOff;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)selectSlider:(UISlider *)sender;
- (IBAction)selectSwitch:(UISwitch *)sender;
- (IBAction)selectStepper:(UIStepper *)sender;

@end
