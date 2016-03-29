//
//  myNavigation_C.m
//  SineWB
//
//  Created by TRF-MAC on 16/3/28.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "myNavigation_C.h"

@interface myNavigation_C ()

@end

@implementation myNavigation_C

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count>0)
        viewController.hidesBottomBarWhenPushed=YES;
    
    
    [super pushViewController:viewController animated:animated];
}


@end






















