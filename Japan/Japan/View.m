//
//  View.m
//  Japan
//
//  Created by NYU User on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;	//in pixels
    CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
	

    /*
     Create the invisible square that will surround the circle.
     Place the upper left corner of the square at the upper left corner of
     the View.  bounds.origin.x and bounds.origin.y are the coordinates of
     the upper left corner of the View.
     */
    CGRect r = CGRectMake(
        -radius,
        -radius,
        2 * radius,
        2 * radius
    );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
	CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
	CGContextScaleCTM(c, 1, -1);
	
	CGContextBeginPath(c); //unnecessary here: the path is already empty.
    
	//CGContextAddEllipseInRect(c, r);
    //CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGRect   vertical = CGRectMake(-shortSide / 2, -longSide / 2, shortSide, longSide);
    CGContextAddRect(c, horizontal);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 0.5);	
	CGContextFillPath(c);
	
	CGContextBeginPath(c);
	CGContextRotateCTM(c, M_PI / 2);
	CGContextAddRect(c, horizontal);
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 0.5);
	CGContextFillPath(c);
	
}


@end
