//
//  TeamMemberViewController.h
//  CollaB
//
//  Created by James J. Kim on 2/15/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMember.h"

@interface TeamMemberViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//Team Member Object
@property TeamMember *teamMember;

@end
