//
//  ManhattanAppDelegate.h
//  Manhattan
//
//  Created by NYU User on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface ManhattanAppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end
