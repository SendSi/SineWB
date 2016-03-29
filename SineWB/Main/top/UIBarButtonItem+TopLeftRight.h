//
//  UIBarButtonItem+TopLeftRight.h
//  SineWB
//
//  Created by scuplt on 16-3-28.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 分类    1,左上角与右上角....系统默认是蓝色的,要搞成美工  图 那样 */
@interface UIBarButtonItem (TopLeftRight)
/** 分类,左上角与右上角....系统默认是蓝色的,要搞成美工  图 那样 */
+(UIBarButtonItem *)myBarButtonItem_pic:(NSString *)pic and_HightPic:(NSString *)hightPic  and_target:(id) target and_action:(SEL)action;
@end
