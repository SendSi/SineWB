//
//  OAuth_Model.h
//  SineWB
//
//  Created by scuplt on 16-3-30.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuth_Model : NSObject<NSCoding>
//"access_token" = "2.00jCrH4D09j_nX93dfdbed03LyFqfC";
//"expires_in" = 157679999;
//"remind_in" = 157679999;
//uid = 3090126421;
@property (copy,nonatomic) NSString *access_token;
@property (assign,nonatomic) long  long  expires_in;
@property (assign,nonatomic) long  long  remind_in;
@property (assign,nonatomic) long  long  uid;

@property (strong,nonatomic) NSDate *expiresTime;

-(instancetype)initModels:(NSDictionary *)dict;
+(instancetype)initInstance:(NSDictionary *)dict;
@end
