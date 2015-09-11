//
//  FontListViewController.m
//  Fonts
//
//  Created by James Kim on 8/7/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "FontListViewController.h"
#import "FavoritesList.h"
#import "FontSizesViewController.h"
#import "FontInfoViewController.h"

@interface FontListViewController ()

@property (assign, nonatomic) CGFloat cellPointSize;

@end

@implementation FontListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
                                      
    self.cellPointSize = preferredTableViewFont.pointSize;
    
    if (self.showsFavorites)
    {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    
}

- (UIFont *) fontForDisplayAtIndexPath: (NSIndexPath *) indexPath
{
    NSString *fontName = self.fontNames[indexPath.row];
    
    return [UIFont fontWithName: fontName size: self.cellPointSize];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    if (self.showsFavorites)
    {
        self.fontNames = [FavoritesList sharedFavoriteList].favorites;
    }
    else
    {
        [self.tableView reloadData];
    }
}

- (BOOL) tableView:(nonnull UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return self.showsFavorites;
}

- (void) tableView:(nonnull UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    [[FavoritesList sharedFavoriteList] moveItemAtIndex: sourceIndexPath.row toIndex: destinationIndexPath.row];
    self.fontNames = [FavoritesList sharedFavoriteList].favorites;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fontNames count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FontName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    cell.textLabel.font = [self fontForDisplayAtIndexPath: indexPath];
    cell.textLabel.text = self.fontNames[indexPath.row];
    cell.detailTextLabel.text = self.fontNames[indexPath.row];
    
    return cell;
}

#pragma mark - Navigaton

- (void) prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender
{
    //Get the new view controller using [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell: sender];
    UIFont *font = [self fontForDisplayAtIndexPath: indexPath];
    [segue.destinationViewController navigationItem].title = font.fontName;
    
    if ([segue.identifier isEqualToString:@"ShowFontSizes"])
    {
        FontSizesViewController *sizesVC = segue.destinationViewController;
        sizesVC.font = font;
    }
    else if ([segue.identifier isEqualToString: @"ShowFontInfo"])
    {
        FontInfoViewController *infoVC = segue.destinationViewController;
        infoVC.font = font;
        infoVC.favorite = [[FavoritesList sharedFavoriteList].favorites containsObject: font.fontName];
    }
    
}

- (void) tableView:(nonnull UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (!self.showsFavorites) return;
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSString *favorite = self.fontNames[indexPath.row];
        [[FavoritesList sharedFavoriteList] removeFavorites: favorite];
        self.fontNames = [FavoritesList sharedFavoriteList].favorites;
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationFade];
    }
}

@end
