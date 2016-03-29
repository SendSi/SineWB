//
//  mySearchText.m
//  SineWB
//
//  Created by scuplt on 16-3-28.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "mySearchText.h"
#import "UIImage+StringImageNamed.h"

@implementation mySearchText
+(instancetype)mySearchInput{
    return [[self alloc] init];
}
-(id)initWithFrame:(CGRect)frame{
    self=[super  initWithFrame:frame];
    if(self){
        self.frame=CGRectMake(0, 0, 300, 30);//初步写成 这Rect
        [self setBackground:[UIImage resizedImageWithName:@"searchbar_textfield_background"]];//resizedImageWithName对图片 拉伸 处理
        //左边搜索 的小图片
        UIImageView *literView=[[UIImageView alloc]initWithImage:[UIImage imageWithNamed:@"searchbar_textfield_search_icon"]];//
        literView.frame=CGRectMake(0, 0, 25, 30);//不这样写,图片会紧靠左边.不好看
        literView.contentMode=UIViewContentModeCenter;
        self.leftView=literView;
        self.leftViewMode=UITextFieldViewModeAlways;//让左边 一直出现
        //字体
        self.font=[UIFont systemFontOfSize:12];
        
        self.clearButtonMode=UITextFieldViewModeAlways;
        // textField.placeholder=@"搜索";//单纯这样写,显示 比较 不清楚.使用attributedPlaceholder
        NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
        self.attributedPlaceholder=[[NSAttributedString alloc ]initWithString:@"搜索" attributes:attrs];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.leftView.frame=CGRectMake(0, 0, 25, self.frame.size.height);//右变小,自己改动width值
}
@end





















