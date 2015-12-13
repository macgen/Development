//
//  TeamViewController.h
//  CollaB
//
//  Created by James J. Kim on 2/15/15.
//  Copyright (c) 2015 James J. Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
- (IBAction)unwindToListFromProjects:(UIStoryboardSegue *) segue;

@end
