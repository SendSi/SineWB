//
//  myTabBar_V.h
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myTabBar_V;
@protocol myTabBar_V_Delegate<NSObject>
@optional
-(void)myTabBar_ClickBottom:(myTabBar_V *)myTabBar and_From:(int) froms and_To:(int )tos;
-(void)myTabBar_ClickPlugs:(myTabBar_V *)myTabBar ;

@end


/**  改变 tabBar 视图的 ,继承UIView   */
@interface myTabBar_V : UIView

-(void) loadViewShow:(UITabBarItem *)barItem;
/* 点击按钮的 代理   */
@property (weak,nonatomic) id<myTabBar_V_Delegate> delegate;

@end
