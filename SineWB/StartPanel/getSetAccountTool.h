//
//  toolsOpen.h
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  OAuth_Model;
@interface getSetAccountTool : NSObject
/* 保存 存储账号信息  */
+(void)setAccount:(OAuth_Model *)accountModel;

/* 返回存储 账号信息  */
+(OAuth_Model *)getAccount;
@end
