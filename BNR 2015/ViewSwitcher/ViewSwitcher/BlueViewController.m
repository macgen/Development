//
//  BlueViewController.m
//  ViewSwitcher
//
//  Created by James Kim on 7/17/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

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

- (IBAction) blueButtonPressed:(id)sender
{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Blue View Button" message:@"You pressed the button on the blue view" preferredStyle: UIAlertControllerStyleAlert];
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yep, I did" style: UIAlertActionStyleDefault handler:nil];
//    [alert addAction: action];
//    [self presentViewController: alert animated: YES completion: nil];
    
    //You need a controller first...
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Blue View Button" message:@"You pressed the button on the blue view !" preferredStyle:UIAlertControllerStyleAlert];
    
    //You need an action for the alert...
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yep, I did !" style: UIAlertActionStyleDefault handler: nil];
    
    //You need to add the action to the alert controller
    [alertController addAction: action];
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
