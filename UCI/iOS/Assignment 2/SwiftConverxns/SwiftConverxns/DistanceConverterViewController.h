//
//  DistanceConverterViewController.h
//  SwiftConverxns
//
//  Created by James Kim on 1/23/16.
//  Copyright © 2016 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DistanceConverterViewController : UIViewController <UITextFieldDelegate>

-(NSString *) milesToKilos: (double) miles;
-(NSString *) kilosToMIles: (double) kilos;

@end
