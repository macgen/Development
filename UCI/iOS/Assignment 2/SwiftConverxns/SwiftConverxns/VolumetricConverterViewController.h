//
//  VolumetricConverterViewController.h
//  SwiftConverxns
//
//  Created by James Kim on 1/24/16.
//  Copyright © 2016 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VolumetricConverterViewController : UIViewController <UITextFieldDelegate>


-(NSString *) litersToGallons: (double) liters;
-(NSString *) gallonsToLiters: (double) gallons;

@end
