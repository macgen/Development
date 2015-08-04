//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by James Kim on 7/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "CustomPickerViewController.h"

@interface CustomPickerViewController ()

@property (strong, nonatomic) NSArray *images;

@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (assign, nonatomic) SystemSoundID *winSoundID;
@property (assign, nonatomic) SystemSoundID *crunchSoundID;

@end

@implementation CustomPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.images = @[
                    [UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]
                    ];
    
    self.winLabel.text = @" ";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spin:(id)sender //We're NOT verifying that the images match but we are using a single array and matching the array index to see if the values are the same...
{
    BOOL win = NO; // Check to see if the user has won.. initial value is NO...
    
    int numInRow = 1; //Keep track of how many matching numbers we have...
    int lastVal = -1; //Since lastVal will be compared to the newVal, we need to initialize this value to be non matching starting number
    
    for (int i = 0; i < 5; i++)
    {
        int newValue = arc4random_uniform((uint) [self.images count]); //Grab a random number from the list of items we have in the images array...
        
        if (newValue == lastVal) //If newValue matches the lastValue...
        {
            numInRow++; //we wil increment the numbers matching...
        }
        else
        {
            numInRow = 1; //if not, we will reset the counter of matching to 1 again...
        }
        
        lastVal = newValue; //regardless of the newVal, we need to assign the newValue to the lastVal so that we could restart the process
        
        [self.picker selectRow: newValue inComponent: i animated: YES]; //load the component of "i" with the newValue...
        [self.picker reloadComponent:1]; //reload that particular compoenent...
        
        if (numInRow >= 3) //check if the numberInRow is equal to or more than 3..
        {
            win = YES; //if so.. win
        }
        
        if (_crunchSoundID == 0)
        {
            NSBund *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
            NSURL *soundURL = [NSURL fileURLWithPath: path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, _crunchSoundID);
        }
        
        AudioServicesPlaySystemSound(*(_crunchSoundID));
        
        if (win)
        {
            [self performSelector:@selector(playWinSound) withObject:nil afterDelay:.5];
        }
        else
        {
            [self performSelector:@selector(showButton) withObject:nil afterDelay:.5];
        }
        
        self.button.hidden = YES;
        self.winLabel.text = @" ";
    }
}

- (CGFloat) pickerView:(nonnull UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

- (void) showButton
{
    self.button.hidden = NO;
}

- (void) playWinSound
{
    if (_winSoundID == 0)
    {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundURL, &_winSoundID);
        
        AudioServicesPlaySystemSound(*(_winSoundID));
        self.winLabel.text = @"WIN!!!!";
        
        [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
        
                                                                          
    }
}

#pragma mark -
#pragma mark Picker View Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger) pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.images count];
}



#pragma mark Picker View Delete Methods


- (UIView *) pickerView:(nonnull UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    
    return imageView;
}

@end
