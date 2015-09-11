//
//  ColorpickerViewController.h
//  colorpicker
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorpickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) NSArray *colorArray;

@end
