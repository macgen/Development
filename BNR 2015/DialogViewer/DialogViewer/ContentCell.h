//
//  ContentCell.h
//  DialogViewer
//
//  Created by James Kim on 8/18/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;
@property (assign, nonatomic) CGFloat maxWidth;

+ (CGSize) sizeForContentString: (NSString *) s forMaxWidth: (CGFloat) maxWidth;

@end
