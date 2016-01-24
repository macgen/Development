//
//  VolumetricConverterViewController.m
//  SwiftConverxns
//
//  Created by James Kim on 1/24/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "VolumetricConverterViewController.h"

@interface VolumetricConverterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *litersTextField;
@property (nonatomic, weak) IBOutlet UITextField *gallonsTextField;

@end

@implementation VolumetricConverterViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) litersToGallons: (double) liters
{
    //1l = 0.264172052gal
    double gallons = (liters * 0.264172052);
    
    return [NSString stringWithFormat:@"%.2f", gallons];
}

-(NSString *) gallonsToLiters: (double) gallons
{
    double liters = gallons / 0.264172052;
    
    return [NSString stringWithFormat:@"%.2f", liters];
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
    if (textField == _litersTextField)
    {
        double gallons = [_litersTextField.text doubleValue];
        
        NSLog(@"Liters Text Field: %@", _litersTextField.text);
        
        _gallonsTextField.text = [self litersToGallons: gallons];
    }
    else if (textField == _gallonsTextField)
    {
        double liters = [_gallonsTextField.text doubleValue];
        
        NSLog(@"Gallons Text Field: %@", _litersTextField.text);
        
        _litersTextField.text = [self gallonsToLiters: liters];
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
