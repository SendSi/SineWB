//
//  myNavigation_C.m
//  SineWB
//
//  Created by TRF-MAC on 16/3/28.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "myNavigation_C.h"
#import "UIImage+StringImageNamed.h"
//#import  "NSAttributedString.h"
@interface myNavigation_C ()

@end

@implementation myNavigation_C

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count>0)//栈底 且有一个 才 不显示
        viewController.hidesBottomBarWhenPushed=YES;
    
    [super pushViewController:viewController animated:animated];
}
/* 只调用一次  */
+(void)initialize{
    //设置导航栏 主题--就是 正中间的
    [self setupNavBarTheme];
    
    /* 设置导航 栏 按钮主题  就 右上角样式  */
    [self setupBarButtonItemTheme];
}

/* 设置导航 栏 按钮主题  就 右上角样式  */
+(void)setupBarButtonItemTheme{
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    if(!iOS7){
        //设置三种状况下的 按钮 背景
        [item setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
  }
    
    //设置文字属性  不能点击时的
    NSMutableDictionary *dictNoEnable=[NSMutableDictionary dictionary];
    dictNoEnable[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    dictNoEnable[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:dictNoEnable forState:UIControlStateDisabled];
    
    //设置文字属性
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName]=iOS7?[UIColor orangeColor]:[UIColor grayColor];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:14];
  //  dict[NSShadowAttributeName]=[NSValue valueWithUIOffset:UIOffsetZero];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
 
}

/* 设置导航栏  */
+(void)setupNavBarTheme{
    UINavigationBar *navBar=[UINavigationBar appearance];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName]=[UIColor blackColor];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:22];
    [navBar setTitleTextAttributes:dict];
}


@end






















