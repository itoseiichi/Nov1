//
//  View.m
//  America
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
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();

	//seven red stripes
	CGContextBeginPath(c);
	//CGContextAddRect(c, CGRectMake( 0 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake( 2 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake( 4 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake( 6 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake( 8 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake(10 * w / 13, 0, w / 13, h));
	//CGContextAddRect(c, CGRectMake(12 * w / 13, 0, w / 13, h));
	for (int i = 0; i <= 12; i = i + 2){
		CGContextAddRect(c, CGRectMake(i * w /13, 0, w / 13, h));
	}
	
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);

	//blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);

	//White star has 5 vertices (points).
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);

	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);

	//Barack Obama from Democratic.
	UIImage *image1 = [UIImage imageNamed: @"barack_obama.jpg"];	//100 by 100
	if (image1 == nil) {
		NSLog(@"could not find the image1");
		return;
	}

	//Mitt Romney from Republican.
	UIImage *image2 = [UIImage imageNamed: @"mitt_romney.jpg"];	//100 by 100
	if (image2 == nil) {
		NSLog(@"could not find the image2");
		return;
	}

	//upper left corner of image1
	CGPoint point1 = CGPointMake(
		(w - image1.size.width) / 2,
		 h - image1.size.height - image2.size.height - 40
	);

	[image1 drawAtPoint: point1];
	
	
	//upper left corner of image2
	CGPoint point2 = CGPointMake(
		(w - image2.size.width) / 2,
		 h - image2.size.height - 20
								 );
	
	[image2 drawAtPoint: point2];

	UIFont *font01 = [UIFont boldSystemFontOfSize: 20.0];
    NSString *string01 = @"Which is the next President?"; 
	CGSize size01 = [string01 sizeWithFont: font01];
	CGPoint point01 = CGPointMake((w - size01.width) / 2 , size01.height + 20);
	CGContextRef c_string01 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string01, 0, 0, 0, 1);
	[string01 drawAtPoint: point01 withFont: font01];
	
	
	UIFont *font02 = [UIFont boldSystemFontOfSize: 30.0];
    NSString *string02 = @"YES,HE IS!!"; 
	CGSize size02 = [string02 sizeWithFont: font02];
	CGPoint point02 = CGPointMake((w - size02.width) / 2 , size01.height +size02.height  + 20);
	CGContextRef c_string02 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string02, 0, 1, 0, 1);
	[string02 drawAtPoint: point02 withFont: font02];
	
	NSString *string03 = @"YES";
	NSString *string04 = @"NO";
	
	[string03 drawAtPoint: point1 withFont: font02];
	[string04 drawAtPoint: point2 withFont: font02];

}


@end
