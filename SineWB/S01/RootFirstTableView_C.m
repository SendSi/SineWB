//
//  RootFirstTableView_C.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "RootFirstTableView_C.h"
#import "UIImage+StringImageNamed.h"
#import "UIBarButtonItem+TopLeftRight.h"
#import "topButton.h"
@interface RootFirstTableView_C()

@end


@implementation RootFirstTableView_C

-(void)viewDidLoad
{
    [super viewDidLoad];
    /*
    //要这样写,因为,系统内置的是 蓝色 会覆盖 背景
    UIButton *btn=[[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    btn.frame=(CGRect){CGPointZero,btn.currentBackgroundImage.size};
    [btn addTarget:self action:@selector(ClickFriend) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    */
    
    //要这样写,因为,系统内置的是 蓝色 会覆盖 背景
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem myBarButtonItem_pic:@"navigationbar_friendsearch" and_HightPic:@"navigationbar_friendsearch_highlighted" and_target:self  and_action:@selector(ClickFriend)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem myBarButtonItem_pic:@"navigationbar_pop" and_HightPic:@"navigationbar_pop_highlighted" and_target:self and_action:@selector(ClickPop)];
    
    topButton *top=[[topButton alloc] init];
    [top setTitle:@"helloworld" forState:UIControlStateNormal];
    [top setImage:[UIImage imageWithNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [UIImage imageWithNamed:@"navigationbar_arrow_up"];
    top.frame=CGRectMake(0, 0, 100, 30);
    [top addTarget:self action:@selector(clickMyTop:) forControlEvents:UIControlEventTouchUpInside];
    top.tag=1;
    self.navigationItem.titleView=top;
}

-(void)clickMyTop:(topButton *) tops{
 
    if(tops.tag==1){
        [tops setImage:[UIImage imageWithNamed:@"navigationbar_arrow_down"]  forState:UIControlStateNormal];   tops.tag=0;
    }
    else{
         [tops setImage:[UIImage imageWithNamed:@"navigationbar_arrow_up"]  forState:UIControlStateNormal];     tops.tag=1;
    }
}

-(void)ClickFriend{
    NSLogs(@"fs");
}
-(void)ClickPop{
    NSLogs(@"ClickPop");
}
@end
