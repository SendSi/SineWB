//
//  myUser_Model.m
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myUser_Model.h"

@implementation myUser_Model


-(instancetype)initModels:(NSDictionary *)dict{
    if(self=[super init]){
        self.name=dict[@"name"];
        self.idstr=dict[@"idstr"];
        self.profile_image_url=dict[@"profile_image_url"];
    }
    return  self;
}
+(instancetype)initInstance:(NSDictionary *)dict{
    return [[self alloc]initModels:dict];
}



@end



