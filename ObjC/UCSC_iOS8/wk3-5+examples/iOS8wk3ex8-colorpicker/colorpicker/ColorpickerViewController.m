//
//  ColorpickerViewController.m
//  colorpicker
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "ColorpickerViewController.h"

@interface ColorpickerViewController ()

@end

@implementation ColorpickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create Array to hold color objects
    self.colorArray = [[NSArray alloc] initWithObjects:@"Blue", @"Green", @"Orange", @"Purple", @"Red", @"Yellow", nil];
}

// Return 1 column in picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

// Return 6 rows in picker view
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [self.colorArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    // return @"Row Name";
    return [self.colorArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // NSLog(@"the %d row was selected in the %d component", row, component);
    NSLog(@"Selected Row %ld in the %ld component", (long)row, (long)component);
    
    switch (row) {
        case 0:
            self.colorLabel.text = @"Blue #0000FF";
            self.colorLabel.textColor = [UIColor blueColor];
            break;
            
        case 1:
            self.colorLabel.text = @"Green #00FF00";
            self.colorLabel.textColor = [UIColor greenColor];
            break;
            
        case 2:
            self.colorLabel.text = @"Orange #FF681F";
            self.colorLabel.textColor = [UIColor orangeColor];
            break;
            
        case 3:
            self.colorLabel.text = @"Purple #FF00FF";
            self.colorLabel.textColor = [UIColor purpleColor];
            break;
            
        case 4:
            self.colorLabel.text = @"Red #FF0000";
            self.colorLabel.textColor = [UIColor redColor];
            break;
            
        case 5:
            self.colorLabel.text = @"Yellow #FFFF00";
            self.colorLabel.textColor = [UIColor yellowColor];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
