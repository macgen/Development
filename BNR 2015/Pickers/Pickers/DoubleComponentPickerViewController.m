//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by James Kim on 7/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent   1

@interface DoubleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *doublePIcker;
@property (strong, nonatomic) NSArray *fillingTypes;
@property (strong, nonatomic) NSArray *breadTypes;

@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender
{
    NSInteger fillingRow = [self.doublePIcker selectedRowInComponent: kFillingComponent];
    NSInteger breadRow = [self.doublePIcker selectedRowInComponent: kBreadComponent];
    
    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread = self.breadTypes[breadRow];
    
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ will be right up !.", filling, bread];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you for your order !!!" message: message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Great !" style: UIAlertActionStyleDefault handler:nil];
    
    [alert addAction: action];
    [self presentViewController: alert animated: YES completion: nil];
}

#pragma mark - 
#pragma mark Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kFillingComponent)
    {
        return [self.fillingTypes count];
    }
    else
    {
        return [self.breadTypes count];
    }
}

#pragma mark Picker View Delegate Methods
- (NSString *) pickerView:(nonnull UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kBreadComponent)
    {
        return self.breadTypes[row];
    }
    else
    {
        return self.fillingTypes[row];
    }
}

@end
