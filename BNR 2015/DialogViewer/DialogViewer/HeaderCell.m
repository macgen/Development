//
//  HeaderCell.m
//  DialogViewer
//
//  Created by James Kim on 8/18/15.
//  Copyright © 2015 James. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        self.label.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.9 blue: 0.1 alpha: 1.0];
        self.label.textColor = [UIColor blackColor];
    }
    
    return self;
}

+ (UIFont *) defaultFont
{
    return [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
}

@end
