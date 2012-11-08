//
//  View.m
//  Manhattan
//
//  Created by NYU User on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CLLocation.h>	//for CLLocationCoordinate2D
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
    static CLLocationCoordinate2D a[] = {
		{45.50510535870543, 141.92819609375},
		{44.07052767838797, 143.8233376953125},
		{43.991540013921814, 144.8780251953125},
		{44.32258071616086, 145.3833962890625},
		{43.864940804425416, 145.0318337890625},
		{43.37182446387124, 145.3614236328125},
		{43.37182446387124, 145.8008767578125},
		{43.00335161080521, 144.9878884765625},
		{42.98728060248037, 144.3067361328125},
		{42.37346963981174, 143.2740212890625},
		{41.91731068000416, 143.2300759765625},
		{42.6811331070194, 141.5601541015625},
		{42.40592661679869, 140.9009744140625},
		{42.6003159602996, 140.5054666015625},
		{42.259738073449896, 140.2637673828125},
		{42.09690794215545, 140.5713845703125},
		{42.14580100409771, 140.7032205078125},
		{41.81913488502535, 141.1207009765625},
		{41.70440594151089, 140.9229470703125},
		{41.81913488502535, 140.6153298828125},
		{41.68799934881622, 140.4395486328125},
		{41.45786774677567, 140.2198220703125},
		{41.60590361476388, 139.9122048828125},
		{41.80275759557597, 140.1319314453125},
		{41.99900865199094, 140.1319314453125},
		{42.27599802371332, 139.7583962890625},
		{42.63265541566207, 139.8023416015625},
		{42.98728060248037, 140.5274392578125},
		{43.24391228935809, 140.3077126953125},
		{43.323888942688015, 140.5274392578125},
			{43.115730976692134, 141.0328103515625},
				{43.21189218999576, 141.2964822265625},
				{43.3877945583091, 141.4063455078125},
				{43.801540159309866, 141.3184548828125},
				{43.928274091208955, 141.6040994140625},
				{44.25966853573655, 141.5821267578125},
				{44.5735554822294, 141.8238259765625},
				{45.22723293969644, 141.5601541015625},
				{45.397206056441966, 141.6919900390625}
		};
	static const size_t n = sizeof a / sizeof a[0];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGSize s = self.bounds.size;
	CGContextTranslateCTM(c, s.width / 2, s.height / 2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	CGFloat xtranslate = -140;
	CGFloat ytranslate = -43;
	CGFloat scale = 20;	//pixels per degree of latitude
    
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI / 180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, a[0].longitude, a[0].latitude);
	
	for (size_t i = 1; i < n; ++i) {
		CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
	}
	
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//opaque red
	CGContextFillPath(c);
}

@end
