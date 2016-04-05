//
//  myPhotos_View.h
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myPhoto_View;
/** 图片...继承UIView  */
@interface myPhotos_View : UIView

/**     图片数组   */
@property (strong,nonatomic) NSArray    *photos;

/** 根据图片 的个数 返回相册的最终 尺寸  */
+(CGSize) photosViewSizeWithPhotosCount:(int) count;
@end
