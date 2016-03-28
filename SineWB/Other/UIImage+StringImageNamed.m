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
    UIImage *images=[self imageWithNamed:name];
    return [images stretchableImageWithLeftCapWidth:images.size.width*0.5 topCapHeight:images.size.height*0.5];
}

@end
