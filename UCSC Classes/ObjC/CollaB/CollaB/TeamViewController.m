//
//  TeamViewController.m
//  CollaB
//
//  Created by James J. Kim on 2/15/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "TeamViewController.h"
#import "TeamMemberViewController.h"
#import "AddProjectsViewController.h"
#import "TeamMember.h"

@interface TeamViewController ()
@property (weak, nonatomic) IBOutlet UITableView *listMemberTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *projectPickerView;

@property NSMutableArray *teamMembers;
@property NSMutableArray *projects;

@end

@implementation TeamViewController

//This method is only called once when the app loads
- (void)viewDidLoad
{
    [super viewDidLoad];

    //Instantiating team members array
    self.teamMembers = [[NSMutableArray alloc] init];

    //Instantiating projects array
    self.projects = [[NSMutableArray alloc] init];

    [self loadInitialData];
}

//This method is used from "Add New Member" segue 
- (IBAction)unwindToList: (UIStoryboardSegue *) segue
{
    TeamMemberViewController *source = [segue sourceViewController];
    TeamMember *member = source.teamMember;

    
    if (member != nil)
    {
        [self.teamMembers addObject:member];
        [self.listMemberTableView reloadData];
    }
}

- (IBAction) unwindToListFromProjects:(UIStoryboardSegue *) segue
{
    AddProjectsViewController *source = [segue sourceViewController];
    Projects *project = source.project;
    
    if (project != nil)
    {
        NSString *projectName = [NSString stringWithFormat:@"%@", project.projectName];
        [self.projects addObject: projectName];
        [self.projectPickerView reloadAllComponents];
            
    }
}

//Intial loads the data
- (void) loadInitialData
{
    TeamMember *member1 = [[TeamMember alloc] init];
    member1.firstName = @"James";
    member1.lastName = @"Kim";
    [self.teamMembers addObject:member1];
    NSLog(@"%@, %@", member1.firstName, member1.lastName);
    
    TeamMember *member2 = [[TeamMember alloc] init];
    member2.firstName = @"Yuko";
    member2.lastName = @"Kim";
    [self.teamMembers addObject:member2];
    NSLog(@"%@, %@", member2.firstName, member2.lastName);
    
    NSLog(@"%@, %@", member1.firstName, member1.lastName);
    
    
    [self.projects addObject:@"Project 1"];
    [self.projects addObject:@"Project 2"];
    
    
    
}

#pragma mark UIPickerView Methods
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.projects count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.projects objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//NSLog(@"The %@ row was selected in the %ld component.", [_teams objectAtIndex:row], (long)component);
    
    NSString *message = [NSString stringWithFormat:@"%@", [self.projects objectAtIndex:row]];
    
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your favorite team is: " message:message delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"OK", nil];
    
    //[alert show];
}

#pragma mark TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.teamMembers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtoTypeCell" forIndexPath:indexPath];

    NSLog(@"%lu", indexPath.row);
    TeamMember *member = [self.teamMembers objectAtIndex:indexPath.row];
    //NSString *firstName = member.firstName;
    //NSLog(@"%ld, %@", [self.teamMembers count], member.firstName);
    //NSLog(@"%@, %@", member.firstName, member.lastName);
    cell.textLabel.text = member.firstName;
    cell.detailTextLabel.text = member.eMail;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
