//
//  myStatusCell.m
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myStatusCell.h"
#import "myStatusFrame.h"
#import "myStatus_Model.h"
#import "myUser_Model.h"
#import "UIImageView+WebCache.h"
#import "myStatus_ToolBar.h"
#import "UIImage+StringImageNamed.h"

@interface myStatusCell()
/** 顶部的view  */
@property (nonatomic,weak) UIImageView *topView;
/**头像         */
@property (nonatomic,weak) UIImageView    *iconView;
/** *会员图标         */
@property (nonatomic,weak) UIImageView    *vipView;
/** 配图         */
@property (nonatomic,weak) UIImageView    *photoView;

/** 5昵称         */
@property (nonatomic,weak) UILabel    *nameLabel;
/** 6时间         */
@property (nonatomic,weak) UILabel    *timeLabel;
/** 7来源         */
@property (nonatomic,weak) UILabel    *sourceLabel;
/** 8正文 内容         */
@property (nonatomic,weak) UILabel    *contentLabel;


/** 转发的:::5父控件        */
@property (nonatomic,weak) UIImageView    *retweetView;
/** 转发的:::昵称         */
@property (nonatomic,weak) UILabel    *retweetNameLabel;
/** 转发的:::配图        */
@property (nonatomic,weak) UIImageView    *retweetPhoto;
/** 转发的:::正文 内容         */
@property (nonatomic,weak) UILabel    *retweetContentLabel;


/** 微博 工具条        */
@property (nonatomic,weak) myStatus_ToolBar *statusToolBar;

@end

/** 顶部的view  */
@interface myStatusCell()

@end

@implementation myStatusCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //原创微博内部 子控件
        [self setupOriginalSubviews];
        //转发 微博 内部 子控件
        [self setupRetweetSubviews];
        //添加 微博的工具条
        [self setupStatusToolBar_subviews];
    }
    return self;
}
/** 原创微博内部 子控件  */
-(void)setupOriginalSubviews{
    self.selectedBackgroundView=[[UIView alloc] init];
    
    UIImageView *topView= [[UIImageView alloc] init];
    [self.contentView addSubview:topView];
    self.topView=topView;
    topView.image=[UIImage resizedImageWithName:@"timeline_card_top_background"];
    topView.highlightedImage=[UIImage resizedImageWithName:@"timeline_card_top_background_highlighted"];
    
    
    UIImageView *iconView= [[UIImageView alloc] init];
    [self.topView addSubview:iconView];
    self.iconView=iconView;
    
    
    UIImageView *vipView= [[UIImageView alloc] init];
    [self.topView addSubview:vipView];
    self.vipView=vipView;
    vipView.contentMode=UIViewContentModeCenter;
    
    UIImageView *photoView= [[UIImageView alloc] init];
    [self.topView addSubview:photoView];
    self.photoView=photoView;
    
    
    /** 5昵称         */
    UILabel *nameLabel= [[UILabel alloc] init];
    nameLabel.font=statusNameFont;
    [self.topView addSubview:nameLabel];
    self.nameLabel=nameLabel;
    nameLabel.backgroundColor=[UIColor clearColor];
    
    
    /** 6时间         */
    UILabel *timeLabel= [[UILabel alloc] init];
    timeLabel.font=statusTimeFont;
    [self.topView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    timeLabel.backgroundColor=[UIColor clearColor];
    timeLabel.textColor = myColor(240, 140, 19);
    
    /** 7来源         */
    UILabel *sourceLabel= [[UILabel alloc] init];
    sourceLabel.font=statusSourceFont;
    [self.topView addSubview:sourceLabel];
    self.sourceLabel=sourceLabel;
    sourceLabel.backgroundColor=[UIColor clearColor];
    sourceLabel.textColor=myColor(135, 135, 135);
    
    /** 8正文 内容         */
    UILabel *contentLabel= [[UILabel alloc] init];
    [self.topView addSubview:contentLabel];
    contentLabel.font=statusNameFont;
    contentLabel.numberOfLines=0;//换行
    self.contentLabel=contentLabel;
    contentLabel.textColor=myColor(39, 39, 39);
    contentLabel.backgroundColor=[UIColor clearColor];
}

/** 转发:::::: 微博 内部 子控件  */
-(void)setupRetweetSubviews{
    
    /** 转发的:::5父控件        */
    UIImageView *retweetView= [[UIImageView alloc] init];
    [self.topView addSubview:retweetView];
    retweetView.image=[UIImage resizedImageWithName:@"timeline_retweet_background" and_left:0.9 and_top:0.5];
    self.retweetView=retweetView;
    
    /** 转发的:::昵称         */
    UILabel *retweetNameLabel= [[UILabel alloc] init];
    retweetNameLabel.font = retweet_statusNameFont;
    [self.retweetView addSubview:retweetNameLabel];
    self.retweetNameLabel=retweetNameLabel;
    retweetNameLabel.textColor = myColor(67, 107, 163);
    retweetNameLabel.backgroundColor=[UIColor clearColor];
    
    /** 转发的:::配图        */
    UIImageView *retweetPhotoLabel= [[UIImageView alloc] init];
    [self.retweetView addSubview:retweetPhotoLabel];
    self.retweetPhoto=retweetPhotoLabel;
    
    /** 转发的:::正文 内容         */
    UILabel *retweetContentLabel= [[UILabel alloc] init];
    [self.retweetView addSubview:retweetContentLabel];
    retweetContentLabel.font = retweet_statusContentFont;
    retweetContentLabel.numberOfLines = 0;
    self.retweetContentLabel=retweetContentLabel;
    retweetContentLabel.backgroundColor=[UIColor clearColor];
    retweetContentLabel.textColor=myColor(90, 90, 90);
}

/** 添加 微博的工具条  */
-(void )setupStatusToolBar_subviews{
    myStatus_ToolBar *statusToolbar=[[myStatus_ToolBar alloc ] init];
    [self.contentView addSubview:statusToolbar];
    self.statusToolBar=statusToolbar;
}

-(void)setFrame:(CGRect)frame{
    frame.origin.y+=statusTableBorder;
    frame.origin.x=statusTableBorder;
    frame.size.width-=2*statusTableBorder;
    frame.size.height-=statusTableBorder;
    [super setFrame:frame];
}

/**  模型数据 Frame  */
-(void)setStatusFrame:(myStatusFrame *)statusFrame{
    _statusFrame=statusFrame;
    
    //原创微博内部 子控件
    [self setupOriginalData];
    //转发的 微博 内部 子控件
    [self setupRetweetData];
    
    //微博工具条
    [self setupStatusToolbar];
}

/**
 *  微博工具条
 */
- (void)setupStatusToolbar
{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.status_model=self.statusFrame.status;
}

-(void)setupOriginalData{
    myStatus_Model *status=self.statusFrame.status;
    myUser_Model *user=status.user;
    
    self.topView.frame=self.statusFrame.topViewF;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
    self.iconView.frame=self.statusFrame.iconViewF;
    //昵称
    self.nameLabel.text=user.name;
    self.nameLabel.frame =self.statusFrame.nameLabelF;
    //vip
    if(user.mbtype){
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
    CGSize timeLabelSize = [status.created_at sizeWithFont:statusTimeFont];
    self.timeLabel.frame = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    
    //来源
    self.sourceLabel.text=status.source;
    CGFloat sourceLabelX=CGRectGetMaxX(self.timeLabel.frame)+statusCellBorder;
    CGFloat sourceLableY= CGRectGetMaxY(self.statusFrame.nameLabelF) + statusCellBorder * 0.5;
    CGSize  sourceLabelSize=[status.source sizeWithFont:statusTimeFont];
    self.sourceLabel.frame=(CGRect){{sourceLabelX,sourceLableY},sourceLabelSize};
    
    //正文
    self.contentLabel.text=status.text;
    self.contentLabel.frame=self.statusFrame.contentLabelF;
    
    //微博图片
    if(status.thumbnail_pic){
        self.photoView.frame=self.statusFrame.photoViewF;
        [self.photoView sd_setImageWithURL:[NSURL URLWithString:status.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
        self.photoView.hidden=NO;
    }
    else{
        self.photoView.hidden=YES;
    }
    
}
-(void)setupRetweetData{
    myStatus_Model *retweet_status=self.statusFrame.status.retweeted_status;
    myUser_Model *user=retweet_status.user;
    
    if(retweet_status){
        self.retweetView.hidden = NO;
        self.retweetView.frame = self.statusFrame.retweetViewF;
        
        // 2.昵称
        self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
        self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
        
        // 3.正文
        self.retweetContentLabel.text = retweet_status.text;
        self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
        
        // 4.配图
        if (retweet_status.thumbnail_pic) {
            self.retweetPhoto.hidden = NO;
            self.retweetPhoto.frame = self.statusFrame.retweetPhotoF;
            [self.retweetPhoto sd_setImageWithURL:[NSURL URLWithString:retweet_status.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"timeline_image_placeholder"]];
        } else {
            self.retweetPhoto.hidden = YES;
        }
    } else {
        self.retweetView.hidden = YES;
    }
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ids=@"status";
    myStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:ids];
    if(cell==nil)
        cell=[[myStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ids];
    return cell;
}
@end













