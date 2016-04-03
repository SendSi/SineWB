//
//  myStatusFrame.m
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//
#define statusCellBorder 5


#import "myUser_Model.h"
#import "myStatus_Model.h"
#import "myStatusFrame.h"

@implementation myStatusFrame

-(void)setStatus:(myStatus_Model *)status{
    _status=status;
    //cell宽度
    CGFloat cellW=[UIScreen mainScreen] .bounds.size.width;
    
    CGFloat topViewW=cellW;
    CGFloat topViewX=0;
    CGFloat topViewY=0;
    //readonly 只读属性 不能使用 self. 点语法
    //头像
    CGFloat iconViewWH=35;//假设为35的值
    CGFloat iconViewX=statusCellBorder;
    CGFloat iconViewY=statusCellBorder;
    _iconViewF=CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    //昵称
    CGFloat nameLabelX=statusCellBorder+CGRectGetMaxX( _iconViewF);//GetMaxX得到最大值的头像
    CGFloat nameLabelY=iconViewY;
    CGSize nameLabelSize=[status.user.name sizeWithFont:statusNameFont];
    _nameLabelF=(CGRect){{nameLabelX,nameLabelY},nameLabelSize};
    //会员图标
    if(status.user.isVip){
        CGFloat vipViewW=14;
        CGFloat vipViewH=nameLabelSize.height;
        CGFloat vipViewX=CGRectGetMaxX(_nameLabelF) +statusCellBorder;
        CGFloat vipViewY=nameLabelY;
        _vipViewF=CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    }
    //时间--x,y
    CGFloat timeLabelX=nameLabelX;
    CGFloat timeLabelY=statusCellBorder+CGRectGetMaxY( _nameLabelF);//GetMaxX得到最大值的头像
    CGSize timeLabelSize=[status.created_at sizeWithFont:statusTimeFont];
    _timeLabelF=(CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    //来源--x,y
    CGFloat sourceLabelX=statusCellBorder+CGRectGetMaxX( _timeLabelF);
    CGFloat sourceLabelY=timeLabelY;
    CGSize sourceLabelSize=[status.source sizeWithFont:statusSourceFont];
    _sourceLabelF=(CGRect){{sourceLabelX,sourceLabelY},sourceLabelSize};
    
    //微博正文
    CGFloat contentLabelX=iconViewX;
 CGFloat contentLabelY=   MAX(CGRectGetMaxY(_timeLabelF), CGRectGetMaxY(_iconViewF))+statusCellBorder;
    CGFloat contentLabelMaxW=topViewW-2*statusCellBorder;
    CGSize contentLabelSize=[status.text sizeWithFont:statusNameFont constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    _contentLabelF=CGRectMake(contentLabelX, contentLabelY, contentLabelSize.width, contentLabelSize.height);
   // _contentLabelF=(CGRect){{contentLabelX,contentLabelY},contentLabelSize};
    NSLogs(@"contentLabelF=H%F    Y=%F  %@",contentLabelSize.height,contentLabelY,status.text);
    
    CGFloat topViewH=CGRectGetMaxY(_contentLabelF)+statusCellBorder;
    _topViewF=CGRectMake(topViewX, topViewY, topViewW,topViewH);
    _cellHeight=topViewH;
    NSLog(@"cellHeight=%f",_cellHeight);
}

@end




