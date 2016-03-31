//
//  toolsOpen.m
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "getSetAccountTool.h"
#import  "OAuth_Model.h"

@implementation getSetAccountTool
/* 保存 存储账号信息  */
+(void)setAccount:(OAuth_Model *)accountModel{
    NSDate *now=[NSDate date];
    accountModel.expiresTime=[now dateByAddingTimeInterval:accountModel.expires_in];    
    NSString *files=   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.data"];
    [NSKeyedArchiver archiveRootObject:accountModel toFile:files];//归档
}

/* 返回存储 账号信息  */
+(OAuth_Model *)getAccount{
     NSString *files=   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.data"];
    OAuth_Model *accounts=[NSKeyedUnarchiver unarchiveObjectWithFile:files];
    NSDate *now=[NSDate date];
    if([now compare:accounts.expiresTime]==NSOrderedAscending){
        //还没过期 就
        return  accounts;
    }
    else {
        return  nil;
    }
}

@end
