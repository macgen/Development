//
//  TeamMemberViewController.m
//  CollaB
//
//  Created by James J. Kim on 2/15/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import "TeamMemberViewController.h"

@interface TeamMemberViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *memberImage;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *eMailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *classNameTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UISwitch *saveToAddressBookSwitch;


@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eMailLabel;


@end

@implementation TeamMemberViewController

//Method to load initial data when the view is loaded for the very first time.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Check to see if the camera is available..
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIAlertView *noCammeraAlert = [[UIAlertView alloc] initWithTitle:@"ERROR !" message:@"No Camera Found." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [noCammeraAlert show];
        
    }
}

//Only implemented when memory is running low.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
Description: Method utilizes UIImagePickerController to take picture
*/
- (IBAction)takePicture:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

//Browse the picture in the Lbrary or using a Picture
- (IBAction)browsePicture:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

//Instantiate the picker view controller
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.memberImage.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//Memthod to implement when Cancel buttoin is pressed. 
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.saveButton)
    {
        return;
    }
    
    if (self.firstNameTextField.text.length > 0 && self.lastNameTextField.text.length > 0 && self.lastNameTextField.text.length > 0)
    {
        self.teamMember = [[TeamMember alloc] init];
        self.teamMember.firstName = self.firstNameTextField.text;
        self.teamMember.lastName = self.lastNameTextField.text;
        self.teamMember.fullName = [NSString stringWithFormat:@"%@, %@", self.firstNameTextField.text, self.lastNameTextField.text];
        self.teamMember.eMail = self.eMailTextField.text;
        self.teamMember.phoneNumber = self.phoneNumberTextField.text;
        self.teamMember.className = self.classNameTextField.text;
        self.teamMember.memberImage = self.memberImage.image;
    }
    else
    {
        self.firstNameLabel.textColor = [UIColor redColor];
        self.lastNameLabel.textColor = [UIColor redColor];
        self.eMailLabel.textColor = [UIColor redColor];
        
        UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Missing Fields" message:@"First Name, Last Name and eMail is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

@end
