//
//  myTabBar_V.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myTabBar_V.h"

@implementation myTabBar_V

-(void) loadViewShow:(UITabBarItem *)barItem{
    //创建 按钮
    UIButton *buttons=[[UIButton alloc ]init];
    [self addSubview:buttons];
    
    [buttons setTitle:barItem.title forState:UIControlStateNormal];
    [buttons setImage:barItem.image forState:UIControlStateNormal];
    [buttons setImage:barItem.selectedImage forState:UIControlStateSelected];

}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnX;
    CGFloat btnY=0,btnW=self.frame.size.width/self.subviews.count,btnH=self.frame.size.height;
    for (int i=0; i<self.subviews.count; i++) {
        UIButton *buttons=self.subviews[i];
        btnX=i*btnW;
        buttons.frame=CGRectMake(btnX, btnY, btnW, btnH);    
    }
}

@end
