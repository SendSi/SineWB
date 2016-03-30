//
//  AppDelegate.m
//  SineWB
//
//  Created by scuplt on 16-3-26.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBar_C.h"
#import "startOncePanel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //显示 时间栏
    application.statusBarHidden=NO;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",paths);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
//    NSString *key=@"CFBundleVersion";
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    NSString *lastVer= [defaults stringForKey:key];
//    NSDictionary *appDic=[NSBundle mainBundle] .infoDictionary;
//    NSString * currentVer=    appDic[key];
//    NSLogs(@"%@  main中%@",lastVer,currentVer);
//    if ([currentVer isEqualToString:lastVer]) {//相等
//        self.window.rootViewController=[[RootTabBar_C alloc] init];
//    }
//    else{//不等
//        self.window.rootViewController=[[startOncePanel alloc] init];
//        
//        [defaults setObject:currentVer forKey:key];
//        [defaults synchronize];
//    }
    
    
    NSString *key = @"CFBundleVersion";
    
    // 取出沙盒中存储的上次使用软件的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 显示状态栏
        application.statusBarHidden = NO;
        
        self.window.rootViewController = [[RootTabBar_C alloc] init];
    } else { // 新版本
        self.window.rootViewController = [[startOncePanel alloc] init];
        // 存储新版本
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
