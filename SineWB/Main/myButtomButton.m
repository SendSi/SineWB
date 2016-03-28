//
//  myButtomButton.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myButtomButton.h"
#define picH_Ratio 0.7
#define tabBarButtonTitleColor (iOS7 ? [UIColor blackColor] :[UIColor whiteColor])
#define tabBarButtonTitleSelectColor (iOS7 ? myColor(234,103,7) :myColor(248,139,0))

@implementation myButtomButton

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:13];
        
        [self setTitleColor:tabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:tabBarButtonTitleSelectColor forState:UIControlStateSelected];
    }
    return  self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleW=contentRect.size.width;
    CGFloat titleX=0;
    CGFloat titleY=contentRect.size.height*picH_Ratio;
    CGFloat titleH=contentRect.size.height-titleY;
    
    return  CGRectMake(titleX, titleY, titleW, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*picH_Ratio;
    return CGRectMake(0, 0, imageW, imageH);
}
/* 重写 items  */
-(void)setItems:(UITabBarItem *)items{
    _items=items;
    [self setTitle:items.title forState:UIControlStateNormal];
    [self setImage:items.image forState:UIControlStateNormal];
    [self setImage:items.selectedImage forState:UIControlStateSelected];
}
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end












