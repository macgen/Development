//
//  HellotableViewController.m
//  hellotable
//
//  Created by BESS HO on 12/29/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "HellotableViewController.h"

@interface HellotableViewController ()

@end

@implementation HellotableViewController
{
    // Define an instance variable for NSArray
    NSArray *data;
    NSArray *images;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize array with data elements
    data = [NSArray arrayWithObjects:@"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Violet", @"Brown", @"Black", nil];
    
    // Initialize array with images
    images = [NSArray arrayWithObjects:@"red.png", @"orange.png", @"yellow.png", @"green.png", @"blue.png", @"violet.png", @"brown.png", @"black.png", nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return no. of row from NSArray
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Define Table View Cell Identifier
    static NSString *cellIdentifier = @"cellItem";
    
    // Use Dynamic Prototypes for Table View content for repeatable rows
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Assign Table View Cell Default Style and Identifier
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Assign NSArray data to Table View Cell label text
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    // Assign image to Table View Cell Image View
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    
    // Display cell
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
