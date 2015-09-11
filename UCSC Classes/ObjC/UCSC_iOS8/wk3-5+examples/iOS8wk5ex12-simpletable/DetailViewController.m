//
//  DetailViewController.m
//  simpletable
//
//  Created by BESS HO on 12/30/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Display NSArray data from Source's ViewController
    self.detailTitleLabel.text = self.shareArray[0];
    self.detailSubtitleLabel.text = self.shareArray[1];
    self.detailImageView.image = [UIImage imageNamed:self.shareArray[2]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
