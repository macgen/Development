//
//  InterfaceController.m
//  SimpleWeather WatchKit 1 Extension
//
//  Created by James Kim on 8/13/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate
{
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)updateAction
{
    NSURLRequest *requestForWeatherData = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=London,uk"]];
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest: requestForWeatherData returningResponse:&response error:&error];
    
    NSMutableDictionary *allData = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:&error];
    
    NSString *currentWeather = nil;
    NSArray *weather = allData[@"weather"];
    
    for (NSDictionary *weatherDictionary in weather)
    {
        currentWeather = weatherDictionary[@"main"];
    }
    
    [self setImageAndTextWithWeather: currentWeather];
}

- (void) setImageAndTextWithWeather: (NSString *) weatherName
{
    NSString *weatherNameWithoutSpaces = [weatherName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [_weatherImage setImage:[weatherNameWithoutSpaces stringByAppendingString:@".jpg"]];
    
    NSMutableAttributedString *customString = [[NSMutableAttributedString alloc] initWithString: weatherNameWithoutSpaces ];
    [customString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize: 18] range: NSMakeRange(0, [weatherNameWithoutSpaces length])];
    
    [_weatherType setAttributedText: customString];
}
@end



