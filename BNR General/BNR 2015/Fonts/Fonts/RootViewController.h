//
//  RootViewController.h
//  Fonts
//
//  Created by James Kim on 8/6/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesList.h"

@interface RootViewController : UITableViewController

@property (copy, nonatomic) NSArray *familyNames;
@property (assign, nonatomic) CGFloat cellPointSize;
@property (strong, nonatomic) FavoritesList *favoritesList;

@end
