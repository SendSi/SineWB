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
#import "myCompose_Send_ToolBar_V.h"
#import "myCompose_Send_ToolBar_V.h"

@interface myComposeView_C()<UITextViewDelegate,myCompose_Send_ToolBar_VDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
/**    mytext         */
@property (nonatomic,weak) myTextView_send    *sendText;
@property (weak,nonatomic) myCompose_Send_ToolBar_V   *toolBar_V;
@property (weak,nonatomic) UIImageView   *showImage;


@end

@implementation myComposeView_C
-(void)viewDidLoad{
    [super viewDidLoad];
        [self createNavBar];
    [self createTextField];
    [self createToolBar];
    [self createShowImage];
}
#pragma mark -navBar相关内容
-(void)createNavBar{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendClick)];
}
//未审核应用...发送中...
-(void)cancelClick{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)sendClick{
    if(self.showImage.image==nil){
        [self ConnNonImage];//发送没图片的内容
    }
    else {
        [self ConnImageAndText];
    }
 
}
-(void)ConnNonImage{
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"]=[getSetAccountTool getAccount].access_token;
    params[@"status"]=self.sendText.text;
    [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"成功发送"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ConnImageAndText{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"status"] = self.sendText.text;
    params[@"access_token"] = [getSetAccountTool getAccount].access_token;
    
    // 3.发送请求
    [mgr POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) { // 在发送请求之前调用这个block
        // 必须在这里说明要上传哪些文件
        NSData *data = UIImageJPEGRepresentation(self.showImage.image,1.0);
        [formData appendPartWithFileData:data name:@"pic" fileName:@"" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"发送成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark -textField 相关设置
-(void)createTextField{
    myTextView_send *sendText=[[myTextView_send alloc] init];
    sendText.frame=self.view.bounds;
    sendText.alwaysBounceVertical=YES;
    sendText.placeholder=@"分享新鲜事....";
    sendText.placeholderColor=[UIColor lightGrayColor];
    sendText.font=[UIFont systemFontOfSize:15];
    sendText.delegate=self;
    [self.view addSubview:sendText];
    self.sendText=sendText;;
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listerSend) name:UITextViewTextDidChangeNotification object:sendText];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.sendText becomeFirstResponder ];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)listerSend{
    self.navigationItem.rightBarButtonItem.enabled=(  self.sendText.text.length!=0);
}

#pragma mark -toolBar相关
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.sendText resignFirstResponder];
    [self.view endEditing:YES];
}

-(void)createToolBar{
    CGFloat x=0,w=self.view.frame.size.width,h=44,y=self.view.frame.size.height-h;
    myCompose_Send_ToolBar_V *toolBar_V=[[myCompose_Send_ToolBar_V alloc] init];
    toolBar_V.frame=CGRectMake(x, y, w, h);
    [self.view addSubview:toolBar_V];
    self.toolBar_V=toolBar_V;
    toolBar_V.delegate=self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyBoardShow:(NSNotification *)ntion{//键盘弹出
     CGRect rectss =  [ntion.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] ;
    CGFloat times=  [ntion.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:times animations:^{
            self.toolBar_V.transform=CGAffineTransformMakeTranslation(0, -rectss.size.height);
    }];

}
-(void)keyBoardHide:(NSNotification *)ntion{//键盘缩回
    CGFloat times=  [ntion.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:times animations:^{
        self.toolBar_V.transform=CGAffineTransformIdentity;
    }];
}
/**  代理   */
-(void)myCompose_Send_ToolBar_DidClick:(myCompose_Send_ToolBar_V *)vc and_Enumtag:(myCompose_Send_ToolBar_VEnum)tags{
    switch (tags) {
        case myCompose_Send_ToolBar_V_E_Camera:
            [self openCamera];
            break;
        case myCompose_Send_ToolBar_V_E_Texture:
                [self openTexture];
            break;
        default:
            break;
    }
}
-(void)openTexture{
    UIImagePickerController *conImage=[[UIImagePickerController alloc] init];
    conImage.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    conImage.delegate=self;
    [self presentViewController:conImage animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *img=info[UIImagePickerControllerOriginalImage];
    self.showImage.image=img;
}
-(void)openCamera{
    
}
-(void)createShowImage{
    UIImageView *img=[[UIImageView alloc] init];
    img.frame=CGRectMake(10, 80, 100, 100);
    [self.sendText addSubview:img];
    self.showImage =img;
}

@end












