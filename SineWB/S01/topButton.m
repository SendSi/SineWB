//
//  topButton.m
//  SineWB
//
//  Created by scuplt on 16-3-29.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "topButton.h"
#import "UIImage+StringImageNamed.h"


@implementation topButton
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self){
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentRight;
        self.titleLabel.font=[UIFont systemFontOfSize:19];

        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat x,y,w,h;
    y=0,h=self.frame.size.height,w=iconWidth; x=self.frame.size.width-iconWidth;
    return CGRectMake(x, y, w, h);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat x,y,w,h;
    x=0,y=0,h=self.frame.size.height,w=self.frame.size.width-iconWidth;
    return CGRectMake(x, y, w, h);
}

@end
