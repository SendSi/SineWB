//
//  myBadgeButton.m
//  SineWB
//
//  Created by scuplt on 16-3-28.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myBadgeButton.h"
#import "UIImage+StringImageNamed.h"

@implementation myBadgeButton
/* 初始化  */
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.hidden=YES;
        self.userInteractionEnabled=NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:11];
    }
    return self;
}


/* 重写字符串--frame信息与其他  */
-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue=[badgeValue copy];//因为 此字符串的是 copy类型出来的
    
    if(badgeValue!=nil)//也就是 有 值 时
    {
        self.hidden=NO;//不隐藏
        [self setTitle:badgeValue forState:UIControlStateNormal];//设置文字
        
        //设置 frame 的 大小
        CGRect frame=self.frame;
        CGFloat badgeH=self.currentBackgroundImage.size.height;
        CGFloat badgeW=self.currentBackgroundImage.size.width;
        if (badgeValue.length>1) {//一定长度时,左右移
        
            //CGSize badgeSize=[badgeValue sizeWithFont:self.titleLabel.font];
            NSMutableDictionary *mydic=[NSMutableDictionary dictionary];
            mydic[NSFontAttributeName]=self.titleLabel.font;
            CGSize badgeSize=[badgeValue sizeWithAttributes:mydic];
            
            badgeW=badgeSize.width+10;
        }
        frame.size.width=badgeW;
        frame.size.height=badgeH;
        self.frame=frame;
    }
    else{
        self.hidden=YES;
    }
}

@end
