//
//  RootDiscoverTableView_C.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "RootDiscoverTableView_C.h"
#import "UIImage+StringImageNamed.h"
#import "mySearchText.h"
@implementation RootDiscoverTableView_C
-(void)viewDidLoad{
    [super viewDidLoad];
    /*
    UITextField *textField=[[UITextField alloc] init];
    textField.frame=CGRectMake(0, 0, 300, 30);
    [textField setBackground:[UIImage resizedImageWithName:@"searchbar_textfield_background"]];
  //左边搜索 的小图片
    UIImageView *literView=[[UIImageView alloc]initWithImage:[UIImage imageWithNamed:@"searchbar_textfield_search_icon"]];
    literView.frame=CGRectMake(0, 0, 25, 30);//不这样写,图片会紧靠左边.不好看
    literView.contentMode=UIViewContentModeCenter;
    textField.leftView=literView;
    textField.leftViewMode=UITextFieldViewModeAlways;//让左边 一直出现
    //字体
    textField.font=[UIFont systemFontOfSize:12];

    textField.clearButtonMode=UITextFieldViewModeAlways;
       // textField.placeholder=@"搜索";//单纯这样写,显示 比较 不清楚.使用attributedPlaceholder
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
    textField.attributedPlaceholder=[[NSAttributedString alloc ]initWithString:@"搜索" attributes:attrs];
    */
    mySearchText *mySear=[mySearchText mySearchInput];
    mySear.frame=CGRectMake(0, 0,300, 30);
    mySear.returnKeyType=UIReturnKeySearch;
    mySear.enablesReturnKeyAutomatically=YES;
    self.navigationItem.titleView=mySear;
}
@end
