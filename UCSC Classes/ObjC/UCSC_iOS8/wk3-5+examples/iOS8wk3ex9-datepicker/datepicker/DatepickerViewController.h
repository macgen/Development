//
//  DatepickerViewController.h
//  datepicker
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatepickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)button:(id)sender;

@end
