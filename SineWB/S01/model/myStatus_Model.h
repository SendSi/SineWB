//
//  myStatus_Model.h
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>
@class myUser_Model;

/**  微博状态信息   */
@interface myStatus_Model : NSObject
/**  微博id   */
@property (nonatomic,copy) NSString *idstr;

/**  文字   */
@property (nonatomic,copy) NSString *text;
/**  来源  */
@property (nonatomic,copy) NSString *source;
/**  转发数  */
@property (nonatomic,assign) int reposts_count;
/**  评论数   */
@property (nonatomic,assign) int  comments_count;
/** 微博的作者  */
@property (nonatomic,strong) myUser_Model *user;

/**   微博的  单张配图   */
@property (copy,nonatomic) NSString *thumbnail_pic;

/**     被转发的 微博   */
@property (copy,nonatomic) myStatus_Model *retweeted_status;


@end
