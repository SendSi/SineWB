//
//  NSDate+myDate.h
//  SineWB
//
//  Created by scuplt on 16-4-3.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (myDate)

-(BOOL) isToday;

-(BOOL) isYesterday;

-(BOOL) isThisYear;

-(NSDateComponents *)deltaWithNow;
+ (NSString *) returnUploadTime:(NSDictionary *)dic;
@end
