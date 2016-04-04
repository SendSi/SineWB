//
//  UIImage+StringImageNamed.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "UIImage+StringImageNamed.h"

@implementation UIImage (StringImageNamed)
+(UIImage *)imageWithNamed:(NSString *)picName{
    if(iOS7){
        NSString *strNameNew=[picName stringByAppendingString:@"_os7"];
        UIImage *images=[UIImage imageNamed:strNameNew];
        if(images==nil){
            images=[UIImage imageNamed:picName];
        }
        return images;
    }
    return [UIImage imageNamed:picName];
}

+(UIImage *)resizedImageWithName:(NSString *)name{
    return [self resizedImageWithName:name and_left:0.5 and_top:0.5]; 
}

+(UIImage *)resizedImageWithName:(NSString *)name and_left:(CGFloat )left and_top:(CGFloat )top{
    UIImage *images=[self imageWithNamed:name];
    return [images stretchableImageWithLeftCapWidth:images.size.width*left topCapHeight:images.size.height*top];
}

@end
