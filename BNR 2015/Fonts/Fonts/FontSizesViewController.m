//
//  FontSizesViewController.m
//  Fonts
//
//  Created by James Kim on 8/10/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "FontSizesViewController.h"

@interface FontSizesViewController ()

@end

@implementation FontSizesViewController

- (NSArray *) pointSizes
{
    static NSArray *pointSizes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{
                      pointSizes = @[@9,@10,@11,@12,@13,@14,@18,@24,@36,@48,@64,@72,@96,@144];
                  });
    
    return pointSizes;
}

- (UIFont *) fontForDisplayAtIndexPath: (NSIndexPath *) indexPath
{
    NSNumber *pointSizes = self.pointSizes[indexPath.row];
    return [self.font fontWithSize: pointSizes.floatValue];
}

- (NSInteger) tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.pointSizes count];
}

- (UITableViewCell *) tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FontNameAndSize";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text = self.font.fontName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ point", self.pointSizes[indexPath.row]];
    
    return cell;
}


@end
