//
//  AppDelegate.m
//  SwiftConverxns
//
//  Created by James Kim on 1/23/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "AppDelegate.h"
#import "TemperatureConverterViewController.h"
#import "FCCurveViewController.h"
#import "DistanceConverterViewController.h"
#import "VolumetricConverterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Fahrenheit to Celcius Controller
    TemperatureConverterViewController *temperatureConverterViewController = [[TemperatureConverterViewController alloc] initWithNibName:@"TemperatureConverter" bundle: [NSBundle mainBundle]];
    UINavigationController *firstNavController = [[UINavigationController alloc] initWithRootViewController:temperatureConverterViewController];
    firstNavController.tabBarItem.title = @"Temperature";
    
    //Fahrenheit to Celcius Image View Controller
    FCCurveViewController *fcVC = [[FCCurveViewController alloc] initWithNibName:@"FCCurveViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *fcImageController = [[UINavigationController alloc] initWithRootViewController: fcVC];
    fcImageController.tabBarItem.title = @"F-C Diagram";
    
    //Distance Converter
    DistanceConverterViewController *distanceVC = [[DistanceConverterViewController alloc] initWithNibName:@"DistanceConverterViewController" bundle: [NSBundle mainBundle]];
    UINavigationController *distanceController = [[UINavigationController alloc] initWithRootViewController: distanceVC];
    distanceController.tabBarItem.title = @"Distance";
    
    //Volumetric Converter
    VolumetricConverterViewController *volumetricVC = [[VolumetricConverterViewController alloc] initWithNibName:@"VolumetricConverterViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *volumetricController = [[UINavigationController alloc] initWithRootViewController:volumetricVC];
    volumetricController.tabBarItem.title = @"Volumetric";
    
    //TabBar ViewController to hold the other vcs.
    UITabBarController *tbVC = [[UITabBarController alloc] init];
    
    tbVC.viewControllers = [NSArray arrayWithObjects: firstNavController, fcImageController, distanceController, volumetricController,nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tbVC;
    [self.window makeKeyAndVisible];
    

    
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
