//
//  NameAndColorCell.m
//  Table Cells
//
//  Created by James Kim on 7/26/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *colorLabel;

@end

@implementation NameAndColorCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    
    if (self)
    {
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMarker = [[UILabel alloc] initWithFrame: nameLabelRect];
        nameMarker.textAlignment = NSTextAlignmentRight;
        nameMarker.text = @"Name:";
        nameMarker.font = [UIFont boldSystemFontOfSize: 12];
        [self.contentView addSubview: nameMarker];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colorMarker = [[UILabel alloc] initWithFrame: colorLabelRect];
        colorMarker.textAlignment = NSTextAlignmentRight;
        colorMarker.text = @"Color:";
        colorMarker.font = [UIFont boldSystemFontOfSize: 12];
        [self.contentView addSubview: colorMarker];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        self.nameLabel = [[UILabel alloc] initWithFrame: nameValueRect];
        [self.contentView addSubview: _nameLabel];
        
        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
        self.colorLabel = [[UILabel alloc] initWithFrame: colorValueRect];
        [self.contentView addSubview: _colorLabel];
    }
    
    return self;
}
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
