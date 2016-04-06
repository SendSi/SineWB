//
//  startRootSelect.m
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "startRootSelect.h"
#import "RootTabBar_C.h"
#import "startOncePanel.h"
#import "versions_model.h"

@implementation startRootSelect
+(void)selectRootController{
    /*
    //     NSString *key = @"CFBundleVersion";
    //
    //     // 取出沙盒中存储的上次使用软件的版本号
    //     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //     NSString *lastVersion = [defaults stringForKey:key];
    //    NSLogs(@"lastversion=%@",lastVersion);
    //
    //     // 获得当前软件的版本号
    //     NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //
    //     if ([currentVersion isEqualToString:lastVersion]) {
    //     // 显示状态栏
    //      [UIApplication sharedApplication].statusBarHidden = NO;
    //
    //     [UIApplication sharedApplication].keyWindow.rootViewController = [[RootTabBar_C alloc] init];
    //     } else { // 新版本
    //    [UIApplication sharedApplication].keyWindow.rootViewController = [[startOncePanel alloc] init];
    //     // 存储新版本
    //     [defaults setObject:currentVersion forKey:key];
    //     [defaults synchronize];
    //     }
    */
    
    
    NSString *key = @"CFBundleVersion";
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
  //  NSLogs(@"版本号=%@",currentVersion);
    
    versions_model *mel=[self getverisoin_model];
    if(mel==nil){
        [self startOneRoot:currentVersion];
       }
    else  if([mel.versions isEqualToString:currentVersion]){
        [UIApplication sharedApplication].statusBarHidden = NO;
        [UIApplication sharedApplication].keyWindow.rootViewController = [[RootTabBar_C alloc] init];
    }
    else{//两版本不一样
        [self startOneRoot:currentVersion];
    }
}

+(void)startOneRoot:(NSString  *)currentVersion{
    versions_model *ver=[[versions_model alloc] init];
    ver.versions=currentVersion;
    [self setverisoin_model:ver];
          [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].keyWindow.rootViewController = [[startOncePanel alloc] init];
}

/* 返回存储 账号信息  */
+(versions_model *)getverisoin_model{
    NSString *files=   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"versions.data"];
    versions_model *model=[NSKeyedUnarchiver unarchiveObjectWithFile:files];
    return model;
}

+(void)setverisoin_model:(versions_model *)accountModel{
    NSString *files=   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"versions.data"];
    [NSKeyedArchiver archiveRootObject:accountModel toFile:files];//归档
}
@end






