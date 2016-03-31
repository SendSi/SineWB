//
//  myOAuthView_C.m
//  SineWB
//
//  Created by scuplt on 16-3-30.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myOAuthView_C.h"
#import "AFHTTPRequestOperationManager.h"

@interface myOAuthView_C()<UIWebViewDelegate>


@end

@implementation myOAuthView_C

-(void)viewDidLoad{
    [super viewDidLoad];
    
   UIWebView *webView= [[UIWebView alloc] init];
    [self.view addSubview: webView];
    webView.frame=self.view.bounds;
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=499373014&redirect_uri=https://www.hao123.com/"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

-(void)accessTokeWithCode:(NSString *)code{
    //使用 af 创建 请求管理
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    NSMutableDictionary *prams=[NSMutableDictionary dictionary];
    prams[@"client_id"]=@"499373014";
    
}

@end
