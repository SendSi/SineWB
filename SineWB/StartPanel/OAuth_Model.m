
//
//  OAuth_Model.m
//  SineWB
//
//  Created by scuplt on 16-3-30.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "OAuth_Model.h"

@implementation OAuth_Model
-(instancetype)initModels:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
/* 静态  */
+(instancetype)initInstance:(NSDictionary *)dict{
    return [[self alloc] initModels:dict];
}
/* 解析  */
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.access_token=[aDecoder decodeObjectForKey:@"access_token"];
        self.remind_in=[aDecoder decodeInt64ForKey:@"remind_in"];
        self.expires_in=[aDecoder decodeInt64ForKey:@"expires_in"];
        self.uid=[aDecoder decodeInt64ForKey:@"uid"];
        
        self.expiresTime=[aDecoder decodeObjectForKey:@"expiresTime"];
    }
    return self;
}

/* 将文件写入时 调用  系统的方法  归档  */
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expiresTime forKey:@"expiresTime"];
}
@end
