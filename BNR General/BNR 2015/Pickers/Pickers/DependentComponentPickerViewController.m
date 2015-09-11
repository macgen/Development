//
//  DependentComponentPickerViewController.m
//  Pickers
//
//  Created by James Kim on 7/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

#define kStateComponent 0
#define kZipComponent   1

@interface DependentComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;

@end

@implementation DependentComponentPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource: @"statedictionary" withExtension:@"plist"];
    self.stateZips = [NSDictionary dictionaryWithContentsOfURL: plistURL];
    
    NSArray *allStates = [self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector: @selector(compare:)];
    
    self.states = sortedStates;
    
    NSString *selectedStates = self.states[0];
    self.zips = self.stateZips[selectedStates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender
{
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent: kStateComponent];
    NSInteger zipRow = [self.dependentPicker selectedRowInComponent: kZipComponent];
    
    NSString *state = self.states[stateRow];
    NSString *zip = self.zips[zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"You selected zip code %@", zip];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message: message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:nil];
    [alert addAction: action];
    [self presentViewController: alert animated: YES completion: nil];
}

#pragma mark -
#pragma mark Picker View Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        return [self.states count];
    }
    else
    {
        return [self.zips count];
    }
}

#pragma mark Picker View Delegate Methods

- (NSString *) pickerView:(nonnull UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        return self.states[row];
    }
    else
    {
        return self.zips[row];
    }
}

- (void) pickerView:(nonnull UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        
        [self.dependentPicker reloadComponent: kZipComponent];
        [self.dependentPicker selectRow: 0 inComponent: kZipComponent animated: YES];
    }
}

- (CGFloat) pickerView:(nonnull UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat pickerWidth = self.dependentPicker.bounds.size.width;
    
    if (component == kZipComponent)
    {
        return pickerWidth/3;
    }
    else
    {
        return 2 * pickerWidth/3;
    }
    
}

@end
