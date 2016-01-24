//
//  TemperatureConverterViewController.h
//  SwiftConverxns
//
//  Created by James Kim on 1/23/16.
//  Copyright © 2016 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>

-(NSString *) calculateCelcius: (double) fahrenheightTemp;
-(NSString *) calculateFahrenheight: (double) celciusTemp;

@end
