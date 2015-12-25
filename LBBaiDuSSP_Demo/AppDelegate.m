//
//  AppDelegate.m
//  LBBaiDuSSP_Demo
//
//  Created by bison on 15/12/25.
//  Copyright © 2015年 Bison. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //百度广告
    [self BaiDuNew];
    
    return YES;
}

- (void)BaiDuNew{
    [self.window makeKeyAndVisible];
    
    BaiduMobAdSplash	*splash	=	[[BaiduMobAdSplash	alloc]	init];
    splash.delegate	= self;
    //把在mssp.baidu.com上创建后获得的代码位id写到这里
    //    splash.AdUnitTag	=	@"2365464";
    splash.AdUnitTag = @"2365464";
    splash.canSplashClick	=	YES;
    [splash	loadAndDisplayUsingKeyWindow:self.window];
    self.splash	= splash;
    
    //可以在customSplashView上显示包含icon的自定义开屏
    self.customSplashView = [[UIView alloc]initWithFrame:self.window.frame];
    self.customSplashView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.customSplashView];
    [self.window bringSubviewToFront:self.customSplashView];
    
    
    //在baiduSplashContainer用做上展现百度广告的容器，注意尺寸必须大于200*200，并且baiduSplashContainer需要全部在window内，同时开机画面不建议旋转
    CGFloat width = self.window.frame.size.width;
    CGFloat height= self.window.frame.size.height;
    UIView * baiduSplashContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height-100)];
    [self.customSplashView addSubview:baiduSplashContainer];
    
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon.png"]];
    [iconView setFrame:CGRectMake(width/2-70-40, height-90, 80, 80)];
    [self.customSplashView addSubview:iconView];
    
    UIImageView *logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ITBlog.png"]];
    [logoView setFrame:CGRectMake(CGRectGetMaxX(iconView.frame)+40, height-90, 130, 50)];
    [self.customSplashView addSubview:logoView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(logoView.frame)-2, CGRectGetMaxY(logoView.frame), 130, 25)];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor lightGrayColor];
    label.text = @"自学iOS开发进阶首选";
    label.textAlignment = NSTextAlignmentCenter;
    [self.customSplashView addSubview:label];
    //在的baiduSplashContainer里展现百度广告
    [splash loadAndDisplayUsingContainerView:baiduSplashContainer];
}

- (NSString *)publisherId
{
    //    return @"ab17bd77"; //your_own_app_id
    return @"ab17bd77";
}

/**
 *  广告展示成功
 */
- (void)splashSuccessPresentScreen:(BaiduMobAdSplash *)splash
{
    NSLog(@"splashSuccessPresentScreen");
}

/**
 *  广告展示失败
 */
- (void)splashlFailPresentScreen:(BaiduMobAdSplash *)splash withError:(BaiduMobFailReason) reason
{
    NSLog(@"splashlFailPresentScreen withError:%d",reason);
    //自定义开屏移除
    [self.customSplashView removeFromSuperview];
}

/**
 *  广告展示结束
 */
- (void)splashDidDismissScreen:(BaiduMobAdSplash *)splash
{
    NSLog(@"splashDidDismissScreen");
    //自定义开屏移除
    [self.customSplashView removeFromSuperview];
}

/**
 *  广告点击
 */
- (void)splashDidClicked:(BaiduMobAdSplash *)splash
{
    NSLog(@"splashDidClicked");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
