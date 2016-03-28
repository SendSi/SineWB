//
//  myTabBar_V.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myTabBar_V.h"
#import "myButtomButton.h"
@interface myTabBar_V()

@property (nonatomic,strong) myButtomButton *cacheButton;
@end



@implementation myTabBar_V

-(void) loadViewShow:(UITabBarItem *)barItem{
    //创建 按钮
    myButtomButton *buttons=[[myButtomButton alloc ]init];
    [self addSubview:buttons];
    
    buttons.items=barItem;
    /*
    [buttons setTitle:barItem.title forState:UIControlStateNormal];
    [buttons setImage:barItem.image forState:UIControlStateNormal];
    [buttons setImage:barItem.selectedImage forState:UIControlStateSelected];
*/
    [buttons addTarget:self action:@selector(ClickBottomShow:) forControlEvents:UIControlEventTouchDown];
    if(self.subviews.count==1)
      [ self ClickBottomShow:buttons];
}

-(void)ClickBottomShow:(myButtomButton *)myBtn{
    if([self.delegate respondsToSelector:@selector(myTabBar_Delegate:and_From:and_To:)]){
        [self.delegate myTabBar_Delegate:self and_From:(int)self.cacheButton.tag and_To:(int)myBtn.tag];
    }
    
    self.cacheButton.selected=NO;
    myBtn.selected=YES;
    self.cacheButton= myBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnX;
    CGFloat btnY=0,btnW=self.frame.size.width/self.subviews.count,btnH=self.frame.size.height;
    for (int i=0; i<self.subviews.count; i++) {
        myButtomButton *buttons=self.subviews[i];
        btnX=i*btnW;
        buttons.frame=CGRectMake(btnX, btnY, btnW, btnH);
        buttons.tag=i;
    }
}

@end
