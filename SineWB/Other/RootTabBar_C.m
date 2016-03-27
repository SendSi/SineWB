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

@implementation RootTabBar_C

-(void)viewDidLoad{
    [super viewDidLoad ];
    
    RootFirstTableView_C *first=[[RootFirstTableView_C alloc] init];
    first.view.backgroundColor=[UIColor redColor];
    [self loadRootView_C:first and_title:@"首页" and_image:@"tabbar_home" and_pressImage:@"tabbar_home_selected" ];

    RootMessageTableView_C *message=[[RootMessageTableView_C alloc] init];
    message.view.backgroundColor=[UIColor grayColor];
      [self loadRootView_C:message and_title:@"消息" and_image:@"tabbar_message_center" and_pressImage:@"tabbar_message_center_selected" ];
    
    RootDiscoverTableView_C *disCover=[[RootDiscoverTableView_C alloc] init];
    disCover.view.backgroundColor=[UIColor greenColor];
    [self loadRootView_C:disCover and_title:@"广场" and_image:@"tabbar_discover" and_pressImage:@"tabbar_discover_selected" ];
    
    RootMeTableView_C *me=[[RootMeTableView_C alloc] init];
    me.view.backgroundColor=[UIColor blueColor];
    [self loadRootView_C:me and_title:@"我" and_image:@"tabbar_profile" and_pressImage:@"tabbar_profile_selected" ];
}
/**  初始化 x每个 子控制器   */
-(void) loadRootView_C:(UIViewController *)view_C and_title:(NSString *)title and_image:(NSString *)image and_pressImage:(NSString *)pressImage
{
    view_C.title=title;
    view_C.tabBarItem.image=[UIImage imageWithNamed:image];
    if (iOS7) {
        view_C.tabBarItem.selectedImage=[[UIImage imageWithNamed:pressImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else{
        view_C.tabBarItem.selectedImage=[UIImage imageWithNamed:pressImage] ;
    }

    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:view_C];
    [self addChildViewController:nav];
}
@end
















