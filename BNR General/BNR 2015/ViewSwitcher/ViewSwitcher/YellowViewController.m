//
//  YellowViewController.m
//  ViewSwitcher
//
//  Created by James Kim on 7/17/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) yellowButtonPressed:(id)sender
{
    //You need a alert controller so that you could add action..
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Yellow View Button Pressed" message:@"You pressed the button on the yellow view!" preferredStyle: UIAlertControllerStyleAlert];
    
    //You need an action so that you can add it to the alert controller...
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yep, I did !" style: UIAlertActionStyleDefault handler: nil];
    
    //add the action to the controller...
    [alertController addAction: action];
    
    //present the alert to the view...
    [self presentViewController: alertController animated: YES completion: nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
