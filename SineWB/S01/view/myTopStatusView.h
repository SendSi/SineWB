//
//  myTopStatusView.h
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  myStatusFrame;
@interface myTopStatusView : UIImageView

/**  重写statusFrame  frame的值-->仅是头部   */
@property (nonatomic,strong) myStatusFrame *statusFrame;
@end
