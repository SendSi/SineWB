//
//  myTabBar_V.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myTabBar_V.h"
#import "myButtomButton.h"
#import "UIImage+StringImageNamed.h"
@interface myTabBar_V()

@property (nonatomic,strong) myButtomButton *cacheButton;
@property (nonatomic,strong) UIButton *buttonPlugs;
/* 给那四个 正规 bar 按钮 计数  */
@property (nonatomic,strong) NSMutableArray *arrChildButton;
@end



@implementation myTabBar_V

-(NSMutableArray *)arrChildButton{
    if(_arrChildButton==nil){
        _arrChildButton=[NSMutableArray array];
    }
    return _arrChildButton;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        //设置 加号按钮
        UIButton *plugs= [[UIButton alloc ]init];
        
        [plugs setBackgroundImage:[UIImage imageWithNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plugs setBackgroundImage:[UIImage imageWithNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plugs setImage:[UIImage imageWithNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plugs setImage:[UIImage imageWithNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plugs.bounds=CGRectMake(0,0, plugs.currentBackgroundImage.size.width, plugs.currentBackgroundImage.size.height);
        [plugs addTarget:self action:@selector(plugsButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plugs];
        self.buttonPlugs=plugs;
    }
    return self;
}

-(void)plugsButtonClick{
    //使用model 弹出,,,要弹出 ,只能使用代理
    if([self.delegate respondsToSelector:@selector(myTabBar_ClickPlugs:)]){
        [self.delegate myTabBar_ClickPlugs:self];
    }
}

-(void) loadViewShow:(UITabBarItem *)barItem{
    //创建 按钮
    myButtomButton *buttons=[[myButtomButton alloc ]init];
    [self addSubview:buttons];
    
    buttons.items=barItem;
    [self.arrChildButton addObject:buttons];//把 按钮 加进出
    /*
     [buttons setTitle:barItem.title forState:UIControlStateNormal];
     [buttons setImage:barItem.image forState:UIControlStateNormal];
     [buttons setImage:barItem.selectedImage forState:UIControlStateSelected];
     */
    [buttons addTarget:self action:@selector(ClickBottomShow:) forControlEvents:UIControlEventTouchDown];
    if(self.arrChildButton.count==1)
        [ self ClickBottomShow:buttons];
}

-(void)ClickBottomShow:(myButtomButton *)myBtn{
    if([self.delegate respondsToSelector:@selector(myTabBar_ClickBottom:and_From:and_To:)]){
        [self.delegate myTabBar_ClickBottom:self and_From:(int)self.cacheButton.tag and_To:(int)myBtn.tag];
    }
    
    self.cacheButton.selected=NO;
    myBtn.selected=YES;
    self.cacheButton= myBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat allW=self.frame.size.width;
    CGFloat allH=self.frame.size.height;
    CGFloat centerW=allW*0.5;
    CGFloat centerH=allH*0.5;
    self.buttonPlugs.center=CGPointMake(centerW, centerH);
    // self.buttonPlugs.frame=CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    CGFloat btnX;
    CGFloat btnY=0,btnW=allW/self.subviews.count,btnH=allH;
    for (int i=0; i<self.arrChildButton.count; i++) {
        myButtomButton *buttons=self.arrChildButton[i];
        btnX=i*btnW;
        if(i>1)
            btnX+=btnW;
        
        buttons.frame=CGRectMake(btnX, btnY, btnW, btnH);
        buttons.tag=i;
    }
}

@end















