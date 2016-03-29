//
//  UIBarButtonItem+TopLeftRight.m
//  SineWB
//
//  Created by scuplt on 16-3-28.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "UIBarButtonItem+TopLeftRight.h"
#import "UIImage+StringImageNamed.h"

@implementation UIBarButtonItem (TopLeftRight)

/** 分类,左上角与右上角....系统默认是蓝色的,要搞成美工  图 那样 */
+(UIBarButtonItem *)myBarButtonItem_pic:(NSString *)pic and_HightPic:(NSString *)hightPic  and_target:(id) target and_action:(SEL)action{
    UIButton *btn2=[[UIButton alloc] init];
    [btn2 setBackgroundImage:[UIImage imageWithNamed:pic] forState:UIControlStateNormal];//imageWithNamed 也是分类中的一个方法
    [btn2 setBackgroundImage:[UIImage imageWithNamed:hightPic] forState:UIControlStateHighlighted];
    [btn2 addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn2.frame=(CGRect){CGPointZero,btn2.currentBackgroundImage.size};
    return [[UIBarButtonItem alloc] initWithCustomView:btn2];
}
@end
