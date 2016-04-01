//
//  myStatus_Model.m
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myStatus_Model.h"
#import "myUser_Model.h"

@implementation myStatus_Model

-(instancetype)initModels:(NSDictionary *)dict{
    if(self=[super init]){
        self.text=dict[@"text"];
        self.source=dict[@"source"];
        self.idstr=dict[@"idstr"];
        self.reposts_count=[dict[@"reposts_count" ] intValue];
        self.comments_count=[dict[@"comments_count"] intValue];
        self.user=[myUser_Model initInstance:dict[@"user"]];
    }
    return  self;
}
+(instancetype)initInstance:(NSDictionary *)dict{
    return [[self alloc]initModels:dict];
}

@end
