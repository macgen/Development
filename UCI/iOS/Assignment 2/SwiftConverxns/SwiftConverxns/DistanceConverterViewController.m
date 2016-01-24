//
//  DistanceConverterViewController.m
//  SwiftConverxns
//
//  Created by James Kim on 1/23/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "DistanceConverterViewController.h"

@interface DistanceConverterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *milesTextField;
@property (nonatomic, weak) IBOutlet UITextField *kilosTextField;

@end

@implementation DistanceConverterViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) milesToKilos: (double) miles
{
    double kilos = miles / 0.62137;
    
    return [NSString stringWithFormat:@"%.2f", kilos];
}

-(NSString *) kilosToMIles: (double) kilos
{
    double miles = kilos * 0.62137;
    
    return [NSString stringWithFormat:@"%.2f", miles];
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _milesTextField)
    {
        _kilosTextField.text = [self milesToKilos:[textField.text doubleValue]];
    }
    else if (textField == _kilosTextField)
    {
        _milesTextField.text = [self kilosToMIles: [textField.text doubleValue]];
    }
    
    return true;
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
