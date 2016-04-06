//
//  NSDate+myDate.m
//  SineWB
//
//  Created by scuplt on 16-4-3.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "NSDate+myDate.h"

@implementation NSDate (myDate)

-(BOOL) isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

-(BOOL) isYesterday{
//    if (cha/3600>1&&cha/86400<1) {
//        timeString = [NSString stringWithFormat:@"%f", cha/3600];
//        timeString = [timeString substringToIndex:timeString.length-7];
//        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
//    }
    return NO;
}

-(BOOL) isThisYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

/*处理返回应该显示的时间*/
+ (NSString *) returnUploadTime:(NSDictionary *)dic
{
    //Tue May 21 10:56:45 +0800 2013
    NSString *timeStr = [dic objectForKey:@"created_at"];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"E MMM d HH:mm:SS Z y"];
    NSDate *d=[date dateFromString:timeStr];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }
    if (cha/3600>1&&cha/86400<1) {
                timeString = [NSString stringWithFormat:@"%f", cha/3600];
                timeString = [timeString substringToIndex:timeString.length-7];
                timeString=[NSString stringWithFormat:@"%@小时前", timeString];
//        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"HH:mm"];
//        timeString = [NSString stringWithFormat:@"今天 %@",[dateformatter stringFromDate:d]];
    }
    if (cha/86400>1)
    {
                timeString = [NSString stringWithFormat:@"%f", cha/86400];
                timeString = [timeString substringToIndex:timeString.length-7];
                timeString=[NSString stringWithFormat:@"%@天前", timeString];
//        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"YY-MM-dd HH:mm"];
//        timeString = [NSString stringWithFormat:@"%@",[dateformatter stringFromDate:d]];
    }

    return timeString;
}

@end
