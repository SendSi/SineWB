//
//  myStatusCell.m
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myStatusCell.h"
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
@property (nonatomic,weak) UILabel    *retweetPhotoLabel;
/** 转发的:::正文 内容         */
@property (nonatomic,weak) UILabel    *retweetContentLabel;

/** 微博 工具条        */
@property (nonatomic,weak) UIImageView    *statusToolBar;

@end

/** 顶部的view  */
@interface myStatusCell()

@end

@implementation myStatusCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //原创微博内部 子控件
        [self setupOriginalSubviews];
        //转发 微博 内部 子控件
        [self setupRetweetSubviews];
        //添加 微博的工具条
        [self setupStatusToolBar];
    }
    return self;
}
/** 原创微博内部 子控件  */
-(void)setupOriginalSubviews{
   UIImageView *topView= [[UIImageView alloc] init];
    [self.contentView addSubview:topView];
    self.topView=topView;
    
    UIImageView *iconView= [[UIImageView alloc] init];
    [self.topView addSubview:iconView];
    self.iconView=iconView;
    
    UIImageView *vipView= [[UIImageView alloc] init];
    [self.topView addSubview:vipView];
    self.vipView=vipView;
    
    UIImageView *photoView= [[UIImageView alloc] init];
    [self.topView addSubview:photoView];
    self.photoView=photoView;
    
    
    /** 5昵称         */
    UILabel *nameLabel= [[UILabel alloc] init];
    [self.topView addSubview:nameLabel];
    self.nameLabel=nameLabel;
    /** 6时间         */
    UILabel *timeLabel= [[UILabel alloc] init];
    [self.topView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    /** 7来源         */
    UILabel *sourceLabel= [[UILabel alloc] init];
    [self.topView addSubview:sourceLabel];
    self.sourceLabel=sourceLabel;
    /** 8正文 内容         */
    UILabel *contentLabel= [[UILabel alloc] init];
    [self.contentLabel addSubview:contentLabel];
    self.contentLabel=contentLabel;
}

/** 转发:::::: 微博 内部 子控件  */
-(void)setupRetweetSubviews{
    
        /** 转发的:::5父控件        */
    UIImageView *retweetView= [[UIImageView alloc] init];
    [self.topView addSubview:retweetView];
    self.retweetView=retweetView;
    
    /** 转发的:::昵称         */
    UILabel *retweetNameLabel= [[UILabel alloc] init];
    [self.retweetView addSubview:retweetNameLabel];
    self.retweetNameLabel=retweetNameLabel;
    
    /** 转发的:::配图        */
    UILabel *retweetPhotoLabel= [[UILabel alloc] init];
    [self.retweetView addSubview:retweetPhotoLabel];
    self.retweetPhotoLabel=retweetPhotoLabel;
    
    /** 转发的:::正文 内容         */
    UILabel *retweetContentLabel= [[UILabel alloc] init];
    [self.retweetContentLabel addSubview:retweetContentLabel];
    self.retweetContentLabel=retweetContentLabel;
}

/** 添加 微博的工具条  */
-(void )setupStatusToolBar{
    
}
@end













