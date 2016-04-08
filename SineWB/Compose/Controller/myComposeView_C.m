//
//  myComposeView_C.m
//  SineWB
//
//  Created by scuplt on 16-4-7.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myComposeView_C.h"
#import "myTextView_send.h"
#import "OAuth_Model.h"
#import "getSetAccountTool.h"
#import "AFHTTPRequestOperationManager.h"
#import "MBProgressHUD+MJ.h"
#import "myNavigation_C.h"
@interface myComposeView_C()
/**    mytext         */
@property (nonatomic,weak) myTextView_send    *sendText;
@end

@implementation myComposeView_C
-(void)viewDidLoad{
    [super viewDidLoad];

    [self createTextField];    [self createUI];
}
-(void)createTextField{
    myTextView_send *sendText=[[myTextView_send alloc] init];
    sendText.frame=self.view.bounds;
    
    sendText.placeholder=@"分享新鲜事....";
    [self.view addSubview:sendText];
    self.sendText=sendText;;
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listerSend) name:UITextViewTextDidChangeNotification object:sendText];
}

-(void)createUI{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendClick)];
}
//未审核应用...发送中...
-(void)cancelClick{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)sendClick{
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=[getSetAccountTool getAccount].access_token;
    params[@"status"]=self.sendText.text;
    [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"成功发送"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)listerSend{
    self.navigationItem.rightBarButtonItem.enabled=(  self.sendText.text.length!=0);
}

@end
