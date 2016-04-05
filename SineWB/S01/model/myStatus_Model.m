//
//  myStatus_Model.m
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myStatus_Model.h"
#import "myUser_Model.h"
#import "NSDate+myDate.h"
#import "MJExtension.h"
#import "myPhotos_model.h"

@implementation myStatus_Model

-(NSDictionary *)objectClassInArray{
    return @{@"pic_urls":[myPhotos_model class]};
}


-(void)setSource:(NSString *)source{
    if(source==nil)return;
//    int loc =(int) [source rangeOfString:@">"].location + 1;
//    int length=(int)[source rangeOfString:@"</"].location-loc;
//    source=[source substringWithRange:NSMakeRange(loc, length)];
//    _source=[NSString stringWithFormat:@"来自%@",source];
}

- (NSString *)created_at
{
    // _created_at == Fri May 09 16:30:34 +0800 2014
    // 1.获得微博的发送时间
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *createdDate = [fmt dateFromString:_created_at];
    
    // 2..判断微博发送时间 和 现在时间 的差距
    if (createdDate.isToday) { // 今天
        if (createdDate.deltaWithNow.hour >= 1) {
            return [NSString stringWithFormat:@"%d小时前", (int)createdDate.deltaWithNow.hour];
        } else if (createdDate.deltaWithNow.minute >= 1) {
            return [NSString stringWithFormat:@"%d分钟前", (int)createdDate.deltaWithNow.minute];
        } else {
            return @"刚刚";
        }
    } else if (createdDate.isYesterday) { // 昨天
        fmt.dateFormat = @"昨天 HH:mm";
        return [fmt stringFromDate:createdDate];
    } else if (createdDate.isThisYear) { // 今年(至少是前天)
        fmt.dateFormat = @"MM-dd HH:mm";
        return [fmt stringFromDate:createdDate];
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createdDate];
    }
}
@end
