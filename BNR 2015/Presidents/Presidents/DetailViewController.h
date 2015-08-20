//
//  DetailViewController.h
//  Presidents
//
//  Created by James Kim on 8/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

