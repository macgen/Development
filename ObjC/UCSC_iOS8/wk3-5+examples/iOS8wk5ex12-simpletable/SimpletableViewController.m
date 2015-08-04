//
//  SimpletableViewController.m
//  simpletable
//
//  Created by BESS HO on 12/30/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "SimpletableViewController.h"
#import "DetailViewController.h"

@interface SimpletableViewController ()

@end

@implementation SimpletableViewController
{
    // Define an instance variable for NSArray
    NSArray *titles;
    NSArray *subtitles;
    NSArray *images;
    
    // Define NSArray to share data to Detail Scene
    NSArray *shareArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize array with titles
    titles = [NSArray arrayWithObjects:@"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Violet", @"Brown", @"Gray", nil];
    
    // Initialize array with subtitles
    subtitles = [NSArray arrayWithObjects:@"Primary", @"Secondary", @"Primary", @"Secondary", @"Primary", @"Secondary", @"Complementary", @"Complementary", nil];
    
    // Initialize array with images
    images = [NSArray arrayWithObjects:@"red.png", @"orange.png", @"yellow.png", @"green.png", @"blue.png", @"violet.png", @"brown.png", @"black.png", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailviewIdentifier"]) {
        
        // Assign destination's ViewController
        DetailViewController *detail = [segue destinationViewController];
        
        // Assign IndexPath for TableView's selected row
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        // Assign row from selected IndexPath
        NSInteger row = [myIndexPath row];
        
        // Load data into Destination's ViewController
        detail.shareArray = @[titles[row], subtitles[row], images[row]];
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Define Table View Cell Identifier
    static NSString *CellIdentifier = @"Cell";
    
    // Use Dynamic Prototypes for Table View content for repeatable rows
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Assign Table View Cell Default Style and Identifier
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Assign NSArray titles to Table View Cell Title label text
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    
    // Assign NSArray subtitles to Table View Cell Subtitle label text
    cell.detailTextLabel.text = [subtitles objectAtIndex:indexPath.row];
    
    // Assign image to Table View Cell Image View
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    
    // Display cell
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
