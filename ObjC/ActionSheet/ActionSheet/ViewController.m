//
//  ViewController.m
//  ActionSheet
//
//  Created by James on 1/31/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonPressed:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hello" message:@"Hello There !!!" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK Button") style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action)
                               {
                                   NSLog(@"OK PRESSED");
                               }];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel button") style:UIAlertActionStyleCancel handler: ^(UIAlertAction *cancel)
                                   {
                                       NSLog(@"CANCEL PRESSED");
                                   }];
    
    [alert addAction:okButton];
    [alert addAction:cancelButton];
    
    [self presentViewController:alert animated: YES completion:nil];
    
                               

}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString: @"Order"])
    {
        NSLog(@"Order is selected");
    }
    else if ([title isEqualToString:@"Button 1"])
    {
        NSLog(@"Button 1 is selected");
    }
    else if ([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 is selected");
    }
    else if ([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 is selected");
    }
    else if ([title isEqualToString:@"Button 4"])
    {
        NSLog(@"Button 4 is selected");
    }
    else
    {
        NSLog(@"Cancel is selected");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
