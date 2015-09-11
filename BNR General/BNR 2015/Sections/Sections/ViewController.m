//
//  ViewController.m
//  Sections
//
//  Created by James Kim on 7/31/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "ViewController.h"
#import "SearchResultsController.h"

static NSString *SectionsTableIdentifier = @"SectionsTableIdentifer";

@interface ViewController ()

@property (copy, nonatomic) NSDictionary *names;
@property (copy, nonatomic) NSArray *keys;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: SectionsTableIdentifier];
    NSString *path = [[NSBundle mainBundle] pathForResource: @"sortednames" ofType:@"plist"];
    
    self.names = [NSDictionary dictionaryWithContentsOfFile: path];
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    SearchResultsController *resultsController = [[SearchResultsController alloc] initWithNames: self.names keys: self.keys];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController: resultsController];
    UISearchBar *searchBar = self.searchController.searchBar;
    searchBar.scopeButtonTitles = @[@"All", @"Short", @"Log"];
    searchBar.placeholder = @"Enter a search term";
    [searchBar sizeToFit];
    
    self.tableView.tableHeaderView = searchBar;
    self.searchController.searchResultsUpdater = resultsController;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark UITableView Data Source Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.keys count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.keys[section];
    NSArray *nameSection = self.names[key];
    
    return [nameSection count];
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.keys[section];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SectionsTableIdentifier forIndexPath:indexPath];
    
    NSString *key = self.keys[indexPath.section];
    NSArray *namesSection = self.names[key];
    
    cell.textLabel.text = namesSection[indexPath.row];
    return cell;
    
}

- (NSArray *) sectionIndexTitlesForTableView: (UITableView *) tableView
{
    return self.keys;
}

@end
