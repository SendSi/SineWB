//
//  myStatusFrame.m
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//
#import "myUser_Model.h"
#import "myStatus_Model.h"
#import "myStatusFrame.h"
#import "myPhotos_View.h"

@implementation myStatusFrame

-(void)setStatus:(myStatus_Model *)status{
    _status=status;
    //cell宽度
    CGFloat cellW=[UIScreen mainScreen] .bounds.size.width-2*statusTableBorder;
    
    CGFloat topViewW=cellW;
    CGFloat topViewX=0;
    CGFloat topViewY=0;
    CGFloat topViewH=0;
    //readonly 只读属性 不能使用 self. 点语法
    //头像
    CGFloat iconViewWH=35;//假设为35的值
    CGFloat iconViewX=statusCellBorder;
    CGFloat iconViewY=statusCellBorder;
    _iconViewF=CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    //昵称
    CGFloat nameLabelX=statusCellBorder+CGRectGetMaxX( _iconViewF);//GetMaxX得到最大值的头像
    CGFloat nameLabelY=iconViewY;
    NSMutableDictionary *nameDic=[NSMutableDictionary dictionary];
    nameDic[NSFontAttributeName]=statusNameFont;
    CGSize nameLabelSize=[status.user.name sizeWithAttributes:nameDic];
    _nameLabelF=(CGRect){{nameLabelX,nameLabelY},nameLabelSize};
    //会员图标
    if(status.user.mbtype>2){
        CGFloat vipViewW=14;
        CGFloat vipViewH=nameLabelSize.height;
        CGFloat vipViewX=CGRectGetMaxX(_nameLabelF) +statusCellBorder;
        CGFloat vipViewY=nameLabelY;
        _vipViewF=CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    }
    //时间--x,y
    CGFloat timeLabelX=nameLabelX;
    CGFloat timeLabelY=statusCellBorder+CGRectGetMaxY( _nameLabelF);//GetMaxX得到最大值的头像
    NSMutableDictionary *timeDic=[NSMutableDictionary dictionary];
    timeDic[NSFontAttributeName]=statusTimeFont;
    CGSize timeLabelSize=[status.created_at sizeWithAttributes:timeDic];
    _timeLabelF=(CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    //来源--x,y
    CGFloat sourceLabelX=statusCellBorder+CGRectGetMaxX( _timeLabelF);
    CGFloat sourceLabelY=timeLabelY;
    NSMutableDictionary *sourceDic=[NSMutableDictionary dictionary];
    sourceDic[NSFontAttributeName]=statusSourceFont;
    CGSize sourceLabelSize=[status.source sizeWithAttributes:sourceDic];
    _sourceLabelF=(CGRect){{sourceLabelX,sourceLabelY},sourceLabelSize};
    
    //微博正文
    CGFloat contentLabelX=iconViewX;
    CGFloat contentLabelY=   MAX(CGRectGetMaxY(_timeLabelF), CGRectGetMaxY(_iconViewF))+statusCellBorder;
    CGFloat contentLabelMaxW=topViewW-2*statusCellBorder;
    CGSize contentLabelSize=[status.text sizeWithFont:statusNameFont constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    _contentLabelF=CGRectMake(contentLabelX, contentLabelY, contentLabelSize.width, contentLabelSize.height);
    
    //微博配图
    if(status.pic_urls.count>0){
        CGSize photosViewSize = [myPhotos_View photosViewSizeWithPhotosCount:status.pic_urls.count];
        CGFloat photosViewX = contentLabelX;
        CGFloat photosViewY = CGRectGetMaxY(_contentLabelF) + statusCellBorder;
        _photoViewF = CGRectMake(photosViewX, photosViewY, photosViewSize.width, photosViewSize.height);
    }
    
    //被转发微博
    if(status.retweeted_status){
        CGFloat retweetViewW=contentLabelMaxW;
        CGFloat retweetViewX=contentLabelX;
        CGFloat retweViewY=CGRectGetMaxY(_contentLabelF)+statusCellBorder*0.5;
        CGFloat retweViewH=0;
        
        //被转发的昵称
        CGFloat retweetNamelableX=statusCellBorder;
        CGFloat retweetNameLabelY=statusCellBorder;
        NSString *strReName=[NSString stringWithFormat:@"@%@",status.retweeted_status.user.name];
        CGSize retweetNameLabelSize=[strReName sizeWithFont:retweet_statusNameFont];
        _retweetNameLabelF=(CGRect){{retweetNamelableX,retweetNameLabelY},retweetNameLabelSize};
        
        //被转发的  微博正文
        CGFloat retweet_contentLabelX=retweetNamelableX;
        CGFloat retweet_contentLabelY=  CGRectGetMaxY(_retweetNameLabelF)+statusCellBorder;
        CGFloat retweet_contentLabelMaxW=retweetViewW-2*statusTableBorder;
        CGSize retweet_contentLabelSize=[status.retweeted_status.text sizeWithFont:retweet_statusContentFont constrainedToSize:CGSizeMake(retweet_contentLabelMaxW, MAXFLOAT)];
        _retweetContentLabelF=CGRectMake(retweet_contentLabelX, retweet_contentLabelY, retweet_contentLabelSize.width, retweet_contentLabelSize.height);
        
        
           //被转发的 配图
        if(status.retweeted_status.pic_urls.count>0){
//            CGFloat retweet_PhotoViewWH = 70;
//            CGFloat retweet_PhotoViewX = retweet_contentLabelX;
//            CGFloat retweet_PhotoViewY = CGRectGetMaxY(_retweetContentLabelF) + statusCellBorder;
//            _retweetPhotoF = CGRectMake(retweet_PhotoViewX, retweet_PhotoViewY, retweet_PhotoViewWH, retweet_PhotoViewWH);
//            retweViewH = CGRectGetMaxY(_retweetPhotoF);
            
            CGSize retweetPhotosViewSize = [myPhotos_View photosViewSizeWithPhotosCount:(int)status.retweeted_status.pic_urls.count];
            CGFloat retweetPhotosViewX = retweet_contentLabelX;
            CGFloat retweetPhotosViewY = CGRectGetMaxY(_retweetContentLabelF) + statusCellBorder;
            _retweetPhotoF = CGRectMake(retweetPhotosViewX, retweetPhotosViewY, retweetPhotosViewSize.width, retweetPhotosViewSize.height);
            
            retweViewH = CGRectGetMaxY(_retweetPhotoF);
        } else { // 没有配图
            retweViewH = CGRectGetMaxY(_retweetContentLabelF);
        }
        
        retweViewH+=statusCellBorder;
        _retweetViewF=CGRectMake(retweetViewX, retweViewY, retweetViewW, retweViewH);
        topViewH=CGRectGetMaxY(_retweetViewF);
    }//被转发的
    else { // 没有转发微博...主创
        if(status.pic_urls.count>0){
            topViewH=CGRectGetMaxY(_photoViewF);
        }
        else{
            topViewH=CGRectGetMaxY(_contentLabelF);
        }
    }
    
    topViewH+=statusCellBorder;
    _topViewF=CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    //工具条
    CGFloat statusToolBarX=topViewX;
    CGFloat statusToolbarY = CGRectGetMaxY(_topViewF);
    CGFloat statusToolbarW = topViewW;
    CGFloat statusToolbarH = 35;
    _statusToolBarF = CGRectMake(statusToolBarX, statusToolbarY, statusToolbarW, statusToolbarH);
    
    
    _cellHeight=CGRectGetMaxY(_statusToolBarF) +statusTableBorder;
    
}


@end




