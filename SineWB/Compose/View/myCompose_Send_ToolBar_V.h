//
//  myCompose_Send_ToolBar_V.h
//  SineWB
//
//  Created by scuplt on 16-4-8.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//
typedef  enum    {
    myCompose_Send_ToolBar_V_E_Camera,
    myCompose_Send_ToolBar_V_E_Texture,
    myCompose_Send_ToolBar_V_E_Mention,
    myCompose_Send_ToolBar_V_E_Trend,
    myCompose_Send_ToolBar_V_E_Emotion
} myCompose_Send_ToolBar_VEnum;


#import <UIKit/UIKit.h>
@class myCompose_Send_ToolBar_V;
@protocol  myCompose_Send_ToolBar_VDelegate<NSObject>

@optional
-(void)myCompose_Send_ToolBar_DidClick:(myCompose_Send_ToolBar_V *) vc and_Enumtag:(myCompose_Send_ToolBar_VEnum) tags;
@end

@interface myCompose_Send_ToolBar_V : UIView

@property (nonatomic,weak) id<myCompose_Send_ToolBar_VDelegate> delegate;

@end
