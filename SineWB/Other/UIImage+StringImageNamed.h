//
//  UIImage+StringImageNamed.h
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (StringImageNamed)
+(UIImage *)imageWithNamed:(NSString *)picName;
+(UIImage *)resizedImageWithName:(NSString *)name;

@end
