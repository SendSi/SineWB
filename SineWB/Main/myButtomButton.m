//
//  myButtomButton.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myButtomButton.h"
#import "myBadgeButton.h"

@interface myButtomButton()
@property (nonatomic,weak) myBadgeButton *badgeButton;
@end


@implementation myButtomButton

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:13];
        
        [self setTitleColor:tabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:tabBarButtonTitleSelectColor forState:UIControlStateSelected];
        
        //添加 一个提醒 数字 按钮
        myBadgeButton *badgeButton=[[myBadgeButton alloc] init];
        badgeButton.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;//让其 向左 向底部
        [self addSubview:badgeButton];//在按钮中 增加 小红点 数字
        self.badgeButton=badgeButton;
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
    //    [self setTitle:items.title forState:UIControlStateNormal];
    //    [self setImage:items.image forState:UIControlStateNormal];
    //    [self setImage:items.selectedImage forState:UIControlStateSelected];
    
    //KVO监听 属性改变
    [items addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [items addObserver:self forKeyPath:@"title" options:0 context:nil];
    [items addObserver:self forKeyPath:@"image" options:0 context:nil];
    [items addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)dealloc{
    [self.items removeObserver:self forKeyPath:@"badgeValue"];
    [self.items removeObserver:self forKeyPath:@"title"];
    [self.items removeObserver:self forKeyPath:@"image"];
    [self.items removeObserver:self forKeyPath:@"selectedImage"];
}

/* 监听 到 某个 对象 的属性 改变 了 ,就会调用f  */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setTitle:self.items.title forState:UIControlStateSelected];
    [self setTitle:self.items.title forState:UIControlStateNormal];
    
    [self setImage:self.items.image forState:UIControlStateNormal];
    [self setImage:self.items.selectedImage forState:UIControlStateSelected];
    
    //设置提醒数字-->吃吃亏,这里没写,显示不出来
    self.badgeButton.badgeValue=self.items.badgeValue;
    
    //数字提醒 位置
    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

/* 去除 高亮 原有 内容  */
-(void)setHighlighted:(BOOL)highlighted{}
@end












