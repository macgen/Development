//
//  DetailViewController.h
//  simpletable
//
//  Created by BESS HO on 12/30/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailSubtitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

// Declare outlet for NSArray from Source's ViewController
@property (strong, nonatomic) NSArray *shareArray;

@end
