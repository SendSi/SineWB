//
//  myCompose_Send_ToolBar_V.m
//  SineWB
//
//  Created by scuplt on 16-4-8.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myCompose_Send_ToolBar_V.h"

@implementation myCompose_Send_ToolBar_V



-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        // 1.设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNamed:@"compose_toolbar_background"]];
  
        [self CreateButton_norImage:@"compose_camerabutton_background" and_higImage:@"compose_camerabutton_background_highlighted" and_Tag:myCompose_Send_ToolBar_V_E_Camera];
     
        [self CreateButton_norImage:@"compose_toolbar_picture" and_higImage:@"compose_toolbar_picture_highlighted" and_Tag:myCompose_Send_ToolBar_V_E_Texture];
        
        [self CreateButton_norImage:@"compose_mentionbutton_background" and_higImage:@"compose_mentionbutton_background_highlighted" and_Tag:myCompose_Send_ToolBar_V_E_Mention];
        
        [self CreateButton_norImage:@"compose_trendbutton_background" and_higImage:@"compose_trendbutton_background_highlighted" and_Tag:myCompose_Send_ToolBar_V_E_Trend];
        
        [self CreateButton_norImage:@"compose_emoticonbutton_background" and_higImage:@"compose_emoticonbutton_background_highlighted" and_Tag:myCompose_Send_ToolBar_V_E_Emotion];
    }
    return self;
}

-(void)CreateButton_norImage:(NSString *)norImage and_higImage:(NSString *)higImage and_Tag:(NSInteger)tagInt{
    UIButton *buttons=[[UIButton alloc] init];
    buttons.tag=tagInt;
    [buttons setImage:[UIImage imageWithNamed:norImage] forState:UIControlStateNormal];
    [buttons setImage:[UIImage imageWithNamed:higImage] forState:UIControlStateHighlighted];
    [self addSubview:buttons];
    [buttons addTarget:self action:@selector(ClickToolButton:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)ClickToolButton:(UIButton *)myBtn{
if([self.delegate respondsToSelector:@selector(myCompose_Send_ToolBar_DidClick:and_Enumtag:)])
   [self.delegate myCompose_Send_ToolBar_DidClick:self and_Enumtag:(int)myBtn.tag];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat widths=self.frame.size.width/5,heights=self.frame.size.height;
    for (int i=0; i<5; i++) {
        UIButton *myButton=self.subviews[i];
        myButton.frame=CGRectMake(i*widths, 0, widths, heights);
    }
}

@end



