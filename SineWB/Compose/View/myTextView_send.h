//
//  myTextView_send.h
//  SineWB
//
//  Created by scuplt on 16-4-7.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 发 微博 页面的 文本框  */
@interface myTextView_send : UITextView


/**     提示文字   */
@property (copy,nonatomic) NSString *placeholder;

/**     提示文字颜色    */
@property (strong,nonatomic) UIColor *placeholderColor;
@end
