//
//  verisoin_model.h
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 版本信息 */
@interface versions_model : NSObject<NSCoding>
@property (copy,nonatomic) NSString *versions;
-(instancetype)initModels:(NSDictionary *)dict;
+(instancetype)initInstance:(NSDictionary *)dict;
@end
