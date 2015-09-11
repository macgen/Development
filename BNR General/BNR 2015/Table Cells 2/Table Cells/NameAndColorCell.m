//
//  NameAndColorCell.m
//  Table Cells
//
//  Created by James Kim on 7/26/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation NameAndColorCell


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setName:(NSString *)name
{
    if (![name isEqualToString: _name])
    {
        _name = [name copy];
        self.nameLabel.text = _name;
    }
    
}

- (void) setColor:(NSString *)color
{
    if (![color isEqualToString: _color])
    {
        _color = [color copy];
        self.colorLabel.text = _color;
    }

    
}

@end
