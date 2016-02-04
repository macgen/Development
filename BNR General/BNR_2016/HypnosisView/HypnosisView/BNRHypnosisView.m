//
//  BNRHypnosisView.m
//  HypnosisView
//
//  Created by James Kim on 1/28/16.
//  Copyright © 2016 James. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGRect bounds = self.bounds;
    
    //Figure out the center of the bounds rectangle.
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //The circle will be the largest that will fit in the view
//    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
//    
//
//    //Add an arc to the path at center, with the radius of radius, from 0 to 2 * PI radians
//    [path addArcWithCenter:center radius:radius startAngle:0 endAngle: M_PI * 2 clockwise: YES];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        [path moveToPoint: CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter: center radius: currentRadius startAngle: 0 endAngle: M_PI * 2.0 clockwise: YES];
    }
    path.lineWidth = 10;
    //Configure the drawing color to light gray
    [self.circleColor setStroke];
    
    [path stroke];
}

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    //get 3 random between 0 and 1
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    
    UIColor *color = [UIColor colorWithRed: red green: green blue: blue alpha: 1.0];
    self.circleColor = color;
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
