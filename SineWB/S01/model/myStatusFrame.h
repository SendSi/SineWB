//
//  myStatusFrame.h
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//
/**  这些字体宏,只能放在 .h中   */
#define statusNameFont [UIFont systemFontOfSize:15]
#define statusTimeFont [UIFont systemFontOfSize:12]
#define statusSourceFont [UIFont systemFontOfSize:12]
#define statusContentFont [UIFont systemFontOfSize:12]
#define statusCellBorder 5

#define retweet_statusNameFont [UIFont systemFontOfSize:15]
#define retweet_statusTimeFont [UIFont systemFontOfSize:12]
#define retweet_statusSourceFont [UIFont systemFontOfSize:12]
#define retweet_statusContentFont [UIFont systemFontOfSize:12]

#define statusTableBorder 5

#import <Foundation/Foundation.h>
@class myStatus_Model;

@interface myStatusFrame : NSObject

/**     myStatus_Model   */
@property (strong,nonatomic) myStatus_Model *status;
/** 顶部的view  */
@property (nonatomic,assign,readonly) CGRect topViewF;
/**头像         */
@property (nonatomic,assign,readonly)CGRect iconViewF;
/** *会员图标         */
@property (nonatomic,assign,readonly)CGRect vipViewF;
/** 配图         */
@property (nonatomic,assign,readonly)CGRect photoViewF;

/** 5昵称         */
@property (nonatomic,assign,readonly)CGRect nameLabelF;
/** 6时间         */
@property (nonatomic,assign,readonly)CGRect timeLabelF;
/** 7来源         */
@property (nonatomic,assign,readonly)CGRect sourceLabelF;
/** 8正文 内容         */
@property (nonatomic,assign,readonly)CGRect contentLabelF;


/** 转发的:::5父控件        */
@property (nonatomic,assign,readonly)CGRect retweetViewF;
/** 转发的:::昵称         */
@property (nonatomic,assign,readonly)CGRect retweetNameLabelF;
/** 转发的:::配图        */
@property (nonatomic,assign,readonly)CGRect retweetPhotoF;
/** 转发的:::正文 内容         */
@property (nonatomic,assign,readonly)CGRect retweetContentLabelF;

/** 微博 工具条        */
@property (nonatomic,assign,readonly)CGRect statusToolBarF;

/** cell的高度        */
@property (nonatomic,assign,readonly)CGFloat cellHeight;
@end









