//
//  myReweetStatusView.m
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myReweetStatusView.h"
#import "myStatus_Model.h"
#import "myUser_Model.h"
#import "myStatusFrame.h"
#import "UIImageView+WebCache.h"
#import  "myPhotos_model.h"

@interface myReweetStatusView()
/** 转发的:::昵称         */
@property (nonatomic,weak) UILabel    *retweetNameLabel;
/** 转发的:::配图        */
@property (nonatomic,weak) UIImageView    *retweetPhoto;
/** 转发的:::正文 内容         */
@property (nonatomic,weak) UILabel    *retweetContentLabel;

@end

@implementation myReweetStatusView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
            self.image=[UIImage resizedImageWithName:@"timeline_retweet_background" and_left:0.9 and_top:0.5];
        
        /** 转发的:::昵称         */
        UILabel *retweetNameLabel= [[UILabel alloc] init];
        retweetNameLabel.font = retweet_statusNameFont;
        [self addSubview:retweetNameLabel];
        self.retweetNameLabel=retweetNameLabel;
        retweetNameLabel.textColor = myColor(67, 107, 163);
        retweetNameLabel.backgroundColor=[UIColor clearColor];
        
        /** 转发的:::配图        */
        UIImageView *retweetPhotoLabel= [[UIImageView alloc] init];
        [self addSubview:retweetPhotoLabel];
        self.retweetPhoto=retweetPhotoLabel;
        
        /** 转发的:::正文 内容         */
        UILabel *retweetContentLabel= [[UILabel alloc] init];
        [self addSubview:retweetContentLabel];
        retweetContentLabel.font = retweet_statusContentFont;
        retweetContentLabel.numberOfLines = 0;
        self.retweetContentLabel=retweetContentLabel;
        retweetContentLabel.backgroundColor=[UIColor clearColor];
        retweetContentLabel.textColor=myColor(90, 90, 90);
    }
    return self;
}

-(void)setStatusFrame:(myStatusFrame *)statusFrame{
    _statusFrame=statusFrame;
    
    myStatus_Model *retweet_status=self.statusFrame.status.retweeted_status;
    myUser_Model *user=retweet_status.user;
    
    // 2.昵称
    self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
    
    // 3.正文
    self.retweetContentLabel.text = retweet_status.text;
    self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
    
    // 4.配图
    if (retweet_status.pic_urls.count>0) {
        self.retweetPhoto.hidden = NO;
        self.retweetPhoto.frame = self.statusFrame.retweetPhotoF;
        myPhotos_model *modelPhoto=retweet_status.pic_urls[0];
        [self.retweetPhoto sd_setImageWithURL:[NSURL URLWithString:modelPhoto.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"timeline_image_placeholder"]];
    } else {
        self.retweetPhoto.hidden = YES;
    }

    
}

@end
