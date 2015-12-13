//
//  AddProjectsViewController.m
//  CollaB
//
//  Created by James J. Kim on 2/17/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "AddProjectsViewController.h"

@interface AddProjectsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *projectNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dueDateTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.saveButton)
    {
        return;
    }
    
    if (self.projectNameTextField.text.length > 0)
    {
        self.project = [[Projects alloc] init];
        self.project.projectName = self.projectNameTextField.text;
        //self.projects.dueDate = self.dueDateTextField.text;
        //self.projects.createdDate = self.createdDateLabel;
    }
    else
    {
        
        UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Missing Fields" message:@"Project Name & Project Due Date is Required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

@end
