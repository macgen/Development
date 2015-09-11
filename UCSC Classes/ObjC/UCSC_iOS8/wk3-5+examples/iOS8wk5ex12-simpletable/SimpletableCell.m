//
//  SimpletableCell.m
//  simpletable
//
//  Created by BESS HO on 12/30/13.
//  Copyright (c) 2013 BESS HO. All rights reserved.
//

#import "SimpletableCell.h"

@implementation SimpletableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
