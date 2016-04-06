//
//  myTopStatusView.m
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myTopStatusView.h"
#import "myUser_Model.h"
#import "myStatus_Model.h"
#import "UIImageView+WebCache.h"
#import "myStatusFrame.h"
#import "myReweetStatusView.h"
#import "myPhotos_model.h"
#import "myPhotos_View.h"

@interface myTopStatusView()
/**头像         */
@property (nonatomic,weak) UIImageView    *iconView;
/** *会员图标         */
@property (nonatomic,weak) UIImageView    *vipView;
/** 配图         */
@property (nonatomic,weak) myPhotos_View    *photosView;

/** 5昵称         */
@property (nonatomic,weak) UILabel    *nameLabel;
/** 6时间         */
@property (nonatomic,weak) UILabel    *timeLabel;
/** 7来源         */
@property (nonatomic,weak) UILabel    *sourceLabel;
/** 8正文 内容         */
@property (nonatomic,weak) UILabel    *contentLabel;


/** 转发的:::  视图View  另一个类里     */
@property (nonatomic,weak) myReweetStatusView    *retweetView;
@end


@implementation myTopStatusView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.userInteractionEnabled=YES;
        self.image=[UIImage resizedImageWithName:@"timeline_card_top_background"];
        self.highlightedImage=[UIImage resizedImageWithName:@"timeline_card_top_background_highlighted"];

        
        UIImageView *iconView= [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView=iconView;
        
        
        UIImageView *vipView= [[UIImageView alloc] init];
        [self addSubview:vipView];
        self.vipView=vipView;
        vipView.contentMode=UIViewContentModeCenter;
        
        myPhotos_View *photosView= [[myPhotos_View alloc] init];
        [self addSubview:photosView];
        self.photosView=photosView;
        
        
        /** 5昵称         */
        UILabel *nameLabel= [[UILabel alloc] init];
        nameLabel.font=statusNameFont;
        [self addSubview:nameLabel];
        self.nameLabel=nameLabel;
        nameLabel.backgroundColor=[UIColor clearColor];
        
        
        /** 6时间         */
        UILabel *timeLabel= [[UILabel alloc] init];
        timeLabel.font=statusTimeFont;
        [self addSubview:timeLabel];
        self.timeLabel=timeLabel;
        timeLabel.backgroundColor=[UIColor clearColor];
        timeLabel.textColor = myColor(240, 140, 19);
        
        /** 7来源         */
        UILabel *sourceLabel= [[UILabel alloc] init];
        sourceLabel.font=statusSourceFont;
        [self addSubview:sourceLabel];
        self.sourceLabel=sourceLabel;
        sourceLabel.backgroundColor=[UIColor clearColor];
        sourceLabel.textColor=myColor(135, 135, 135);
        
        /** 8正文 内容         */
        UILabel *contentLabel= [[UILabel alloc] init];
        [self addSubview:contentLabel];
        contentLabel.font=statusNameFont;
        contentLabel.numberOfLines=0;//换行
        self.contentLabel=contentLabel;
        contentLabel.textColor=myColor(39, 39, 39);
        contentLabel.backgroundColor=[UIColor clearColor];
        
        //转发微博
        [self setupRetweet_UI];
    }
    return self;
}
-(void)setStatusFrame:(myStatusFrame *)statusFrame{
    _statusFrame=statusFrame;
    myStatus_Model *status=statusFrame.status;
    myUser_Model *user=status.user;
    
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
    self.iconView.frame=self.statusFrame.iconViewF;
    //昵称
    self.nameLabel.text=user.name;
    self.nameLabel.frame =self.statusFrame.nameLabelF;
    //vip
    if(user.mbtype>2){
        self.vipView.hidden=NO;
        NSString *str=[NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank];
        self.vipView.image= [UIImage imageWithNamed:str];
        self.vipView.frame=self.statusFrame.vipViewF;
        
        self.nameLabel.textColor=[UIColor orangeColor];
    }
    else {
        self.nameLabel.textColor=[UIColor blackColor];
        self.vipView.hidden=YES;
    }
    //时间
    self.timeLabel.text = status.created_at;
    CGFloat timeLabelX = self.statusFrame.nameLabelF.origin.x;
    CGFloat timeLabelY = CGRectGetMaxY(self.statusFrame.nameLabelF) + statusCellBorder * 0.5;
    NSMutableDictionary *timeDics=[NSMutableDictionary dictionary];
    timeDics[NSFontAttributeName]=statusTimeFont;
    CGSize timeLabelSize = [status.created_at sizeWithAttributes:timeDics];
    self.timeLabel.frame = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    
    //来源
    self.sourceLabel.text=status.source;
    CGFloat sourceLabelX=CGRectGetMaxX(self.timeLabel.frame)+statusCellBorder;
    CGFloat sourceLableY= CGRectGetMaxY(self.statusFrame.nameLabelF) + statusCellBorder * 0.5;
    NSMutableDictionary *sourcesDics=[NSMutableDictionary dictionary];
    sourcesDics[NSFontAttributeName]=statusSourceFont;
    CGSize  sourceLabelSize=[status.source sizeWithAttributes:sourcesDics];
    self.sourceLabel.frame=(CGRect){{sourceLabelX,sourceLableY},sourceLabelSize};
    
    //正文
    self.contentLabel.text=status.text;
    self.contentLabel.frame=self.statusFrame.contentLabelF;
    
    //微博图片
    if(status.pic_urls.count>0){
//        self.photoView.frame=self.statusFrame.photoViewF;
//        myPhotos_model *photoModel=status.pic_urls[0];
//        [self.photoView sd_setImageWithURL:[NSURL URLWithString:photoModel.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
//        self.photoView.hidden=NO;
        
        self.photosView.hidden = NO;
        self.photosView.frame = self.statusFrame.photoViewF;
        self.photosView.photos = status.pic_urls;
    }
    else{
        self.photosView.hidden=YES;
    }
    //转发微博
    [self setupRetweet_Data];
}

#pragma mark -转发微博 UI 与 Data
-(void)setupRetweet_UI{
    myReweetStatusView *retweetView= [[myReweetStatusView alloc] init];
    [self addSubview:retweetView];
    self.retweetView=retweetView;
}

-(void)setupRetweet_Data{
    myStatus_Model *retweet_status=self.statusFrame.status.retweeted_status;
    if(retweet_status){
        self.retweetView.hidden = NO;
        self.retweetView.frame = self.statusFrame.retweetViewF;
        //这里传递 statusframe的值
        self.retweetView.statusFrame=self.statusFrame;
    } else {
        self.retweetView.hidden = YES;
    }
}
@end






