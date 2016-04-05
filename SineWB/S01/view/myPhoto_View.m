//
//  myPhoto_View.m
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPhoto_View.h"
#import "myPhotos_model.h"
#import "UIImageView+WebCache.h"

@interface myPhoto_View()
/**    gifView         */
@property (nonatomic,weak) UIImageView    *gifView;

@end

@implementation myPhoto_View

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.userInteractionEnabled=YES;
        UIImage *imaage=[UIImage imageWithNamed:@"timeline_image_gif"];
        UIImageView *gifView=[[UIImageView alloc] initWithImage:imaage];
        [self addSubview:gifView];
        self.gifView=gifView;
    }
    return self;
}


-(void)setPhoto:(myPhotos_model *)photo{
    _photo=photo;
    //控制gifVIew的可见性
    self.gifView.hidden=![photo.thumbnail_pic hasSuffix:@"gif"];
    //download图片
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"timeline_image_placeholder"]];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.gifView.layer.anchorPoint=CGPointMake(1, 1);
    self.gifView.layer.position=CGPointMake(self.frame.size.width, self.frame.size.height);
}
@end













