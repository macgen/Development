//
//  FontListViewController.h
//  Fonts
//
//  Created by James Kim on 8/7/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showsFavorites;

@end
