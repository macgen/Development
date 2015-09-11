//
//  RootViewController.m
//  Fonts
//
//  Created by James Kim on 8/6/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "RootViewController.h"
#import "FavoritesList.h"
#import "FontListViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.cellPointSize = preferredTableViewFont.pointSize;
    self.favoritesList = [FavoritesList sharedFavoriteList];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (UIFont *) fontForDisplayAtIndexPath: (NSIndexPath *) indexPath
{
    
    if (indexPath.section == 0)
    {
        NSString *familyName = self.familyNames[indexPath.row];
        NSString *fontName = [[UIFont fontNamesForFamilyName: familyName] firstObject];
        
        return [UIFont fontWithName: fontName size: self.cellPointSize];
    }
    else
    {
        return nil;
    }
}

#pragma mark - 
#pragma mark UITableView DataSouce Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.favoritesList.favorites count] > 0)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [self.familyNames count];
    }
    else
    {
        return 1;
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"All Font Families";
    }
    else
    {
        return @"My Favorite Fonts";
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FamilyNameCell = @"FamilyName";
    static NSString *FavoritesCell = @"Favorites";
    
    UITableViewCell *cell = nil;
    
    //Configure the cell...
    if (indexPath.section == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:FamilyNameCell forIndexPath: indexPath];
        cell.textLabel.font = [self fontForDisplayAtIndexPath: indexPath];
        cell.textLabel.text = self.familyNames[indexPath.row];
        cell.detailTextLabel.text = self.familyNames[indexPath.row];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier: FavoritesCell forIndexPath: indexPath];
    }
    
    return cell;
}

#pragma mark - 
#pragma mark Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Get the new view controller using the [segue destinationViewControlller]...
    NSIndexPath *indexPath = [self.tableView indexPathForCell: sender];
    
    FontListViewController *listVC = segue.destinationViewController;
    
    if (indexPath.section == 0)
    {
        NSString *familyName = self.familyNames[indexPath.row];
        listVC.fontNames = [[UIFont fontNamesForFamilyName: familyName] sortedArrayUsingSelector:@selector( compare:)];
        listVC.navigationItem.title = familyName;
        listVC.showsFavorites = NO;
    }
    else
    {
        listVC.fontNames = self.favoritesList.favorites;
        listVC.navigationItem.title = @"Favorites";
        listVC.showsFavorites = YES;
        
    }
}




@end
