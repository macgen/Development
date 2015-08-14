//
//  InterfaceController.h
//  SimpleWeather WatchKit 1 Extension
//
//  Created by James Kim on 8/13/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *weatherType;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *weatherImage;

- (IBAction)updateAction;

@end
