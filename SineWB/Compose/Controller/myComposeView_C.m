//
//  myComposeView_C.m
//  SineWB
//
//  Created by scuplt on 16-4-7.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myComposeView_C.h"
#import "myTextView_send.h"

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
    [self.view addSubview:sendText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listerSend) name:UITextViewTextDidChangeNotification object:sendText];
}

-(void)createUI{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendClick)];
    self.navigationItem.rightBarButtonItem.enabled=NO;
}
-(void)listerSend{
    self.navigationItem.rightBarButtonItem.enabled=(  self.sendText.text.length!=0);
}
-(void)cancelClick{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)sendClick{
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
