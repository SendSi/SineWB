//
//  myOAuthView_C.m
//  SineWB
//
//  Created by scuplt on 16-3-30.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myOAuthView_C.h"
#import "AFHTTPRequestOperationManager.h"
#import "OAuth_Model.h"
#import "getSetAccountTool.h"
#import "startRootSelect.h"
#import "MBProgressHUD+MJ.h"
@interface myOAuthView_C()<UIWebViewDelegate>


@end

@implementation myOAuthView_C

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIWebView *webView= [[UIWebView alloc] init];
    [self.view addSubview: webView];
    webView.delegate=self;//设置代理
    webView.frame=self.view.bounds;
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=499373014&redirect_uri=https://www.hao123.com/"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    //13543403844
    //mmm389585111
}
#pragma mark -代理 中
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载中..."];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
        [MBProgressHUD hideHUD];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
        [MBProgressHUD hideHUD];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //请求路径....绝对路径
    NSString *urlStr=request.URL.absoluteString;
    NSRange range=[urlStr rangeOfString:@"code="];
    
    //range长度有值,
    if(range.length){
        int loc=(int)(range.location+range.length);
        NSString *code=[urlStr substringFromIndex:loc];
        [self accessTokeWithCode:code];
    }
    return YES;
}

-(void)accessTokeWithCode:(NSString *)code{
    //使用 af 创建 请求管理
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    NSMutableDictionary *prams=[NSMutableDictionary dictionary];
    prams[@"client_id"]=@"499373014";//定义这些字符串
    prams[@"client_secret"]=@"c9375f9cb3bff845a5fca3f7d95d59a0";
    prams[@"grant_type"]=@"authorization_code";
    prams[@"code"]=code;
    prams[@"redirect_uri"]=@"https://www.hao123.com/";
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:prams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        请求成功,将字典转为model
        //        "access_token" = "2.00jCrH4D09j_nX93dfdbed03LyFqfC";
        //        "expires_in" = 157679999;
        //        "remind_in" = 157679999;
        //        uid = 3090126421;
        
        
        //        NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //        NSString *file=[doc stringByAppendingPathComponent:@"oauthData.data"];//记得 在model 写 哪些要 解档 归档
        //        [NSKeyedArchiver archiveRootObject:model toFile:file];
        
        
        OAuth_Model *model=[OAuth_Model initInstance:responseObject];//responseObject是字典类型
        [getSetAccountTool setAccount:model];//把 模型 保存到 data中
        [startRootSelect selectRootController];//选择跳到 控制器
        
            [MBProgressHUD hideHUD];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLogs(@"请求失败%@",error);
    }];
}

@end
