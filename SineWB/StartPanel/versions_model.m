//
//  verisoin_model.m
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "versions_model.h"

@implementation versions_model

-(instancetype)initModels:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)initInstance:(NSDictionary *)dict{
    return [[self alloc] initModels:dict];
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.versions forKey:@"versions"];    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.versions=[aDecoder decodeObjectForKey:@"versions"];
    }
    return  self;
}

@end
