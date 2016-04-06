//
//  RootTabBar_C.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "RootTabBar_C.h"
#import "RootDiscoverTableView_C.h"
#import "RootFirstTableView_C.h"
#import "RootMessageTableView_C.h"
#import "RootMeTableView_C.h"
#import "UIImage+StringImageNamed.h"
#import "myTabBar_V.h"
#import "myNavigation_C.h"
#import "myComposeView_C.h"


@interface RootTabBar_C()<myTabBar_V_Delegate>
@property (nonatomic ,strong) myTabBar_V *myTabBar_Vs;
@end
@implementation RootTabBar_C

-(void)viewDidLoad{
    [super viewDidLoad ];
    [self setUpMyTabBar];
    [self setUpAllChildController];
}
/**  mytabbar 初始化   */
-(void)setUpMyTabBar{
    myTabBar_V *my_V=[[myTabBar_V alloc] init];
    // my_V.backgroundColor=[UIColor redColor];
    my_V.frame=self.tabBar.bounds;
    [self.tabBar addSubview:my_V];
    self.myTabBar_Vs=my_V;
    my_V.delegate=self;
}
#pragma  mark -代理ing
-(void)myTabBar_ClickBottom:(myTabBar_V *)myTabBar and_From:(int)froms and_To:(int)tos{
    self.selectedIndex=tos;
}
-(void)myTabBar_ClickPlugs:(myTabBar_V *)myTabBar{
    myComposeView_C  *coss=[[myComposeView_C alloc] init];
    myNavigation_C *nav_C=[[myNavigation_C alloc ] initWithRootViewController:coss];
    [self presentViewController:nav_C animated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if([child isKindOfClass:[UIControl class]]){
            [child removeFromSuperview];
        }
    }
}

-(void)setUpAllChildController{
    RootFirstTableView_C *first=[[RootFirstTableView_C alloc] init];
    //    first.view.backgroundColor=[UIColor redColor];
    first.tabBarItem.badgeValue=@"12";
    [self loadEventOneRootView_C:first and_title:@"首页" and_image:@"tabbar_home" and_pressImage:@"tabbar_home_selected" ];
    
    RootMessageTableView_C *message=[[RootMessageTableView_C alloc] init];
    message.view.backgroundColor=[UIColor grayColor];
    message.tabBarItem.badgeValue=@"12";
    [self loadEventOneRootView_C:message and_title:@"消息" and_image:@"tabbar_message_center" and_pressImage:@"tabbar_message_center_selected" ];
    
    RootDiscoverTableView_C *disCover=[[RootDiscoverTableView_C alloc] init];
    disCover.view.backgroundColor=[UIColor greenColor];
    [self loadEventOneRootView_C:disCover and_title:@"广场" and_image:@"tabbar_discover" and_pressImage:@"tabbar_discover_selected" ];
    
    RootMeTableView_C *me=[[RootMeTableView_C alloc] init];
    me.view.backgroundColor=[UIColor blueColor];
    [self loadEventOneRootView_C:me and_title:@"我" and_image:@"tabbar_profile" and_pressImage:@"tabbar_profile_selected" ];
}

/**  初始化 每个 子控制器   */
-(void) loadEventOneRootView_C:(UIViewController *)view_C and_title:(NSString *)title and_image:(NSString *)image and_pressImage:(NSString *)pressImage
{
    view_C.title=title;
    view_C.tabBarItem.image=[UIImage imageWithNamed:image];
    if (iOS7) {
        view_C.tabBarItem.selectedImage=[[UIImage imageWithNamed:pressImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else{
        view_C.tabBarItem.selectedImage=[UIImage imageWithNamed:pressImage] ;
    }
    
    myNavigation_C *nav=[[myNavigation_C alloc] initWithRootViewController:view_C];
    [self addChildViewController:nav];
    
    //添加 tabBar内部的按钮--->myTabBar_V
    [self.myTabBar_Vs loadViewShow:view_C.tabBarItem];
}


@end
















