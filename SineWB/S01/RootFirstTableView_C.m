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

@interface RootFirstTableView_C()<UITableViewDelegate>
@property (nonatomic,strong) NSArray *myStatusData;
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
    
    [self setupNavTop];//设置top 的 nav 一栏
 
    [self setupStatusData];
}

/**  网页中的数据   */
-(void)setupStatusData{
    //创建mgr
   AFHTTPRequestOperationManager *mgr= [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=[getSetAccountTool getAccount].access_token;
    params[@"count"]=@12;
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLogs(@"成功了~~%@",responseObject);
        
//        NSMutableArray *statu_M =[NSMutableArray array];
//        NSArray *arrs=responseObject[@"statuses"];
//        for (NSDictionary *dict in arrs) {
//             myStatus_Model *model=[myStatus_Model objectWithKeyValues:dict];
//            [statu_M addObject:model ];
//        }
//        self.myStatusData=statu_M;
        
        self.myStatusData=[myStatus_Model objectArrayWithKeyValuesArray:responseObject[@"statuses"]];//responseObject是字典
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

/**  top nav 一栏   */
-(void)setupNavTop{   //要这样写,因为,系统内置的是 蓝色 会覆盖 背景
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

#pragma  mark  -UITableView代理 
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.myStatusData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cells=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cells];
    if(cell==nil)cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cells];
    
//    NSDictionary *statuses=self.myStatusData[indexPath.row];
//    cell.textLabel.text=statuses[@"text"];
//    NSDictionary *user=statuses[@"user"];//再向字典取值
//    cell.detailTextLabel.text=user[@"name"];
//    NSString *iconUrl=user[@"profile_image_url"];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageWithNamed:@"new_feature_share_false"]];
    
        myStatus_Model *statuses=self.myStatusData[indexPath.row];
    cell.textLabel.text=statuses.text;
        myUser_Model *user=statuses.user;//再向字典取值
        cell.detailTextLabel.text=user.name;
             [cell.imageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithNamed:@"new_feature_share_false"]];

    return  cell;
}
/*
{
    "statuses": [
                 {
                     "created_at": "Tue May 31 17:46:55 +0800 2011",
                     "id": 11488058246,
                     "text": "求关注。"，
                     "source": "<a href="http://weibo.com" rel="nofollow">新浪微博</a>",
                     "favorited": false,
                     "truncated": false,
                     "in_reply_to_status_id": "",
                     "in_reply_to_user_id": "",
                     "in_reply_to_screen_name": "",
                     "geo": null,
                     "mid": "5612814510546515491",
                     "reposts_count": 8,
                     "comments_count": 9,
                     "annotations": [],
                     "user": {
                         "id": 1404376560,
                         "screen_name": "zaku",
                         "name": "zaku",
                         "province": "11",
                         "city": "5",
                         "location": "北京 朝阳区",
                         "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",
                         "url": "http://blog.sina.com.cn/zaku",
                         "profile_image_url": "http://tp1.sinaimg.cn/1404376560/50/0/1",
                         "domain": "zaku",
                         "gender": "m",
                         "followers_count": 1204,
                         "friends_count": 447,
                         "statuses_count": 2908,
                         "favourites_count": 0,
                         "created_at": "Fri Aug 28 00:00:00 +0800 2009",
                         "following": false,
                         "allow_all_act_msg": false,
                         "remark": "",
                         "geo_enabled": true,
                         "verified": false,
                         "allow_all_comment": true,
                         "avatar_large": "http://tp1.sinaimg.cn/1404376560/180/0/1",
                         "verified_reason": "",
                         "follow_me": false,
                         "online_status": 0,
                         "bi_followers_count": 215
                     }
                 },
                 ...
                 ],
    */













@end
