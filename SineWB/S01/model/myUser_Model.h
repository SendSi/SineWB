//
//  myUser_Model.h
//  SineWB
//
//  Created by scuplt on 16-4-1.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>
/**  用户信息 model   */
@interface myUser_Model : NSObject
/**  id   */
@property (nonatomic,copy) NSString *idstr;
/**  名字   */
@property (nonatomic,copy) NSString *name;
/**  用户 icon   */
@property (nonatomic,copy) NSString *profile_image_url;

/**    是否vip         */
@property (nonatomic,assign ,getter=isVip) BOOL    *vip;


@end
