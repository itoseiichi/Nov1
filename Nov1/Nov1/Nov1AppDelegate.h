//
//  Nov1AppDelegate.h
//  Nov1
//
//  Created by Seiichi Ito on 11/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Nov1AppDelegate : UIResponder <UIApplicationDelegate>{
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
