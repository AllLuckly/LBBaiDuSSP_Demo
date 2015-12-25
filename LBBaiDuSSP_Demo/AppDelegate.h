//
//  AppDelegate.h
//  LBBaiDuSSP_Demo
//
//  Created by bison on 15/12/25.
//  Copyright © 2015年 Bison. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaiduMobAdSplashDelegate.h"
#import "BaiduMobAdSplash.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,BaiduMobAdSplashDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BaiduMobAdSplash *splash;

@property (strong, nonatomic) UIView *customSplashView;

@end

