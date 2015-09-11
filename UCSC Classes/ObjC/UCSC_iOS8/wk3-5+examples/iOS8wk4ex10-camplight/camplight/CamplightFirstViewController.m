//
//  CamplightFirstViewController.m
//  camplight
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "CamplightFirstViewController.h"

@interface CamplightFirstViewController ()

@end

@implementation CamplightFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectSlider:(UISlider *)sender {
    // Assign slider value to ViewController's view alpha
    self.view.alpha = self.slider.value + 0.1;
    NSLog(@"Show value %0.2f", self.slider.value);
}

- (IBAction)selectSwitch:(UISwitch *)sender {
    // If switch is on set the ViewController's view background color to yellow
    if (self.switchOnOff.on){
        self.view.backgroundColor = [UIColor yellowColor];
    } else {
        // If switch is off set the view background color to white
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)selectStepper:(UIStepper *)sender {
    // Assign stepper value to alpha value of ViewController's view
    self.view.alpha = self.stepper.value/100 + 0.1;
}
@end
