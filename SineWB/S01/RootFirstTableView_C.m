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
#import "AFHTTPRequestOperationManager.h"
#import "getSetAccountTool.h"
#import "OAuth_Model.h"
#import "UIImageView+WebCache.h"
#import "myUser_Model.h"
#import "myStatus_Model.h"
#import "MJExtension.h"
#import "myStatusFrame.h"
#import "myStatusCell.h"
#import "myPhotos_model.h"

@interface RootFirstTableView_C()<UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *myStatusFrame;
/**    UIRefreshControl         */
@property (nonatomic,weak) UIRefreshControl    *myRefresh;

/**    topButton         */
@property (nonatomic,weak) topButton    *titleButton;
@end


@implementation RootFirstTableView_C
-(NSMutableArray *)myStatusFrame{
    if(_myStatusFrame==nil){
        _myStatusFrame=[NSMutableArray array];
    }
    return _myStatusFrame;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置 刷新 控件
    [self setupRefreshView];
    //设置top 的 nav 一栏
    [self setupNavTop];
//    //加载微博数据
//    [self setupStatusData];
    //设置头部的 user 名字
    [self getUser];
}

-(void) setupRefreshView{
    UIRefreshControl *reControl=[[UIRefreshControl alloc ] init];
    [reControl addTarget:self action:@selector(RefreshControlChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:reControl];
    self.myRefresh=reControl;
    [reControl beginRefreshing];//自动进入刷新状态  不会触发 监听方法
    [self RefreshControlChange:reControl];
    }
-(void)RefreshControlChange:(UIRefreshControl *)contr{
    //创建mgr
    AFHTTPRequestOperationManager *mgr= [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=[getSetAccountTool getAccount].access_token;
    params[@"count"]=@20;
    if(self.myStatusFrame.count>0){
    myStatusFrame *statusFrame=self.myStatusFrame[0];//这样写,跟加载 新数据相关
    params[@"since_id"]=statusFrame.status.idstr;
    }
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *statusArrayResponse=[myStatus_Model objectArrayWithKeyValuesArray:responseObject[@"statuses"]];//responseObject是字典
        
        NSMutableArray *statusFrameArray=[NSMutableArray array];
        for(myStatus_Model *status in statusArrayResponse)
        {
            myStatusFrame *statusFram=[[myStatusFrame alloc] init];
            statusFram.status=status;
            [statusFrameArray addObject:statusFram];
        }

        //加载新数据.
        //1.新建一个数据数组
        NSMutableArray *temparray=[NSMutableArray array];//用空的A先加载新数据B,再加载旧数据C...C就等于A咯
        [temparray addObjectsFromArray:statusFrameArray];//加载新的数据
        [temparray addObjectsFromArray:self.myStatusFrame];//加载原来的数据
        self.myStatusFrame=temparray;
        [self.tableView reloadData];
        [self.myRefresh endRefreshing];
        
        [self showNewStatuCount:statusFrameArray.count];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [self.myRefresh endRefreshing];
    }];
}

-(void)getUser{
    //创建mgr
    AFHTTPRequestOperationManager *mgr= [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=[getSetAccountTool getAccount].access_token;
    params[@"uid"]=@([getSetAccountTool getAccount].uid);

    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        myUser_Model *user=[myUser_Model objectWithKeyValues:responseObject];
        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      
    }];
}


-(void)showNewStatuCount:(NSInteger) counts{
    UIButton *btn=[[UIButton alloc] init];
    [self.navigationController.view insertSubview:btn  belowSubview:self.navigationController.navigationBar];
    btn.userInteractionEnabled=NO;
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    if(counts>0){
        [btn setTitle:[NSString stringWithFormat:@"有%ld微博",counts] forState:UIControlStateNormal];
    }
    else {
        [btn setTitle:@"没新的微博" forState:UIControlStateNormal];
    }
    CGFloat btnH=30,btnY=64-btnH,btnW=self.view.frame.size.width,btnX=0;
    btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
    [UIView animateWithDuration:1.0 animations:^{
        btn.transform=CGAffineTransformMakeTranslation(0, btnH+2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.7 delay:0.7 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            btn.transform=CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [btn removeFromSuperview];
        }];
    }];
}

/**  top nav 一栏   */
-(void)setupNavTop{   //要这样写,因为,系统内置的是 蓝色 会覆盖 背景
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem myBarButtonItem_pic:@"navigationbar_friendsearch" and_HightPic:@"navigationbar_friendsearch_highlighted" and_target:self  and_action:@selector(ClickFriend)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem myBarButtonItem_pic:@"navigationbar_pop" and_HightPic:@"navigationbar_pop_highlighted" and_target:self and_action:@selector(ClickPop)];
    
    topButton *top=[[topButton alloc] init];
    [top setTitle:@"ok" forState:UIControlStateNormal];
    [top setImage:[UIImage imageWithNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    self.titleButton=top;
    [UIImage imageWithNamed:@"navigationbar_arrow_up"];
    top.frame=CGRectMake(0, 0, 100, 30);
    [top addTarget:self action:@selector(clickMyTop:) forControlEvents:UIControlEventTouchUpInside];
    top.tag=1;
    self.navigationItem.titleView=top;
    
    self.tableView.backgroundColor=myColor(226, 226, 226);
    //self.tableView.contentInset=UIEdgeInsetsMake(0, 0, statusTableBorder, 0);
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
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

#pragma  mark  -UITableView代理
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.myStatusFrame.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myStatusCell *cell=[myStatusCell cellWithTableView:tableView];
    //传递cell 模型
    cell.statusFrame=self.myStatusFrame[indexPath.row];
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    myStatusFrame *statusFrame=self.myStatusFrame[indexPath.row];
  //  NSLog(@"CCC_cellHeight=%f",statusFrame.cellHeight);
    return statusFrame.cellHeight;
}
@end


















