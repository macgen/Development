//
//  DetailViewController.m
//  Presidents
//
//  Created by James Kim on 8/20/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem)
    {
        NSDictionary *dict = (NSDictionary *)self.detailItem;
        NSString *urlString = dict[@"url"];
        self.detailDescriptionLabel.text = urlString;
        
        NSURL *url = [NSURL URLWithString: urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL: url];
        [self.webView loadRequest: request];
        
        NSString *name = dict[@"name"];
        self.title = name;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
