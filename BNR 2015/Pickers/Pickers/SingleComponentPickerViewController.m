//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by James Kim on 7/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *characterNames;

@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbaba", @"Artoo", @"Threepion", @"Lando"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@", selected];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message: @"Thank your for choosing!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"You're welcome!" style: UIAlertActionStyleDefault handler: nil];
    [alert addAction: action];
    [self presentViewController: alert animated: YES completion: nil];
}

#pragma mark - 
#pragma mark Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:(nonnull UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.characterNames[row];
}

@end
