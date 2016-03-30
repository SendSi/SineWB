//
//  startOncePanel.m
//  SineWB
//
//  Created by scuplt on 16-pageNumber-29.
//  Copyright (c) 2016年 Scuplt041pageNumber. All rights reserved.
//
#define  pageNumber 3
#import "startOncePanel.h"
#import "UIImage+StringImageNamed.h"
#import "RootFirstTableView_C.h"
@interface startOncePanel()<UIScrollViewDelegate>
@property (weak,nonatomic) UIPageControl *myPageControls;
@end

@implementation startOncePanel
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupPageView];/**  设置 page 大页面   */
    
    [self setupBottomCir];//设置 底部 小圆点
    
}

/**  设置 底部 小圆点   */
-(void)setupBottomCir
{
    UIPageControl *pageControls=[[UIPageControl alloc] init];
    pageControls.numberOfPages=pageNumber;
    
    CGFloat cenX=self.view.frame.size.width*0.5,cenY=self.view.frame.size.height-30;
    pageControls.center=CGPointMake(cenX, cenY);
    pageControls.bounds=CGRectMake(0, 0, 50, 30);
    pageControls.currentPageIndicatorTintColor=myColor(9, 120, 130);
    pageControls.pageIndicatorTintColor=myColor(90, 90, 90);
    [self.view addSubview:pageControls];
    pageControls.userInteractionEnabled=NO;
    self.myPageControls =pageControls;
    
}
/**  设置 page 大页面   */
-(void)setupPageView{
    self.view.backgroundColor=myColor(246,246,246);
    
    UIScrollView *startView=[[UIScrollView alloc] init];
    startView.frame=self.view.bounds;
    [self.view addSubview:startView];
    //代理
    startView.delegate=self;//代理
    CGFloat x=0,y=0,w=self.view.frame.size.width,h=self.view.frame.size.height;
    for (int i=0; i<pageNumber; i++) {
        UIImage *myImage=    [UIImage imageWithNamed:[NSString stringWithFormat: @"new_feature_%d",i+1]];
        UIImageView *images=[[UIImageView alloc] init];
        images.image=myImage;
        x=i*w;
        images.frame=CGRectMake(x, y, w, h);
        [startView addSubview:images];
        
        if(i==pageNumber-1){
            [self setButtonPageNumber:images];
        }
    }
    startView.contentSize=CGSizeMake(pageNumber*w,h);
    startView.showsHorizontalScrollIndicator=NO;
    startView.pagingEnabled=YES;
    startView.bounces=NO;
    
    
}

-(void)setButtonPageNumber:(UIImageView *)pages{
    pages.userInteractionEnabled=YES;
    UIButton *btnStart= [[UIButton alloc]init];
    [btnStart setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [btnStart setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [btnStart setTitle:@"开始微博" forState:UIControlStateNormal];
    [btnStart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat cenX=self.view.frame.size.width*0.5,cenY=self.view.frame.size.height*0.6;
    btnStart.center=CGPointMake(cenX, cenY);
    btnStart.bounds=(CGRect){CGPointZero,btnStart.currentBackgroundImage.size};
    [btnStart addTarget:self action:@selector(ClickStart:) forControlEvents:UIControlEventTouchUpInside];
    [pages addSubview:btnStart];
    
    //增加分分享按钮
    UIButton *shareBtn=[[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [shareBtn setFont:[UIFont systemFontOfSize:14]];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    shareBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    CGFloat cen_X=self.view.frame.size.width*0.5,cen_Y=self.view.frame.size.height*0.5;
    shareBtn.center=CGPointMake(cen_X, cen_Y);
    shareBtn.bounds=CGRectMake(0, 0, 120, 30);
    shareBtn.selected=YES;
    [shareBtn addTarget:self action:@selector(ClickShare:) forControlEvents:UIControlEventTouchUpInside];
    [pages addSubview:shareBtn];
}
-(void)ClickStart:(UIButton *)btns{
    NSLogs(@"fsa");
    self.view.window.rootViewController=[[RootFirstTableView_C alloc] init];
}
-(void)ClickShare:(UIButton *)btns{
    btns.selected=!btns.selected;
}

#pragma mark -当前页的 代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat conX=   scrollView.contentOffset.x;
    double pageD=conX/scrollView.frame.size.width;
    int pageInt=(int)(pageD+0.5);
    self.myPageControls.currentPage=pageInt;
}

@end










