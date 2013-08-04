//
//  PCVAppDelegate.h
//  personalcosmosviewer
//
//  Created by Yumura Tsubasa on 2013/08/04.
//  Copyright (c) 2013年 Yumura Tsubasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCVViewController;

@interface PCVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PCVViewController *viewController;

@end
