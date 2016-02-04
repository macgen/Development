//
//  TemperatureConverterViewController.m
//  SwiftConverxns
//
//  Created by James Kim on 1/23/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "TemperatureConverterViewController.h"
#import "FCCurveViewController.h"

@interface TemperatureConverterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *fahrenheightTextField;
@property (nonatomic, weak) IBOutlet UITextField *celciusTextField;

@end

@implementation TemperatureConverterViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

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

-(NSString *) calculateCelcius: (double) fahrenheightTemp
{
    double fahrenheight = ((fahrenheightTemp - 32) * 5 / 9);
    
    return [NSString stringWithFormat:@"%.2f", fahrenheight];
}

-(NSString *) calculateFahrenheight: (double) celciusTemp
{
    double celcius = ((celciusTemp * 9) / 5 + 32);
    
    return [NSString stringWithFormat:@"%.2f", celcius];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _fahrenheightTextField)
    {
        double fTemp = [_fahrenheightTextField.text doubleValue];
    
        self.celciusTextField.text = [self calculateCelcius: fTemp];
    }
    else if (textField == _celciusTextField)
    {
        double cTemp = [_celciusTextField.text doubleValue];
        
        self.fahrenheightTextField.text = [self calculateFahrenheight: cTemp];
    }
    
    return true;
}

- (IBAction)viewGraph:(id)sender
{
    FCCurveViewController *fcVC = [[FCCurveViewController alloc] initWithNibName:@"FCCurveViewController" bundle: [NSBundle mainBundle]];
    //UINavigationController *fController = [[UINavigationController alloc] initWithRootViewController: fcVC];
    
    [self.navigationController pushViewController: fcVC animated: YES];

    
    

}

@end
