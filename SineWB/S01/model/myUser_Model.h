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

/**    会员等级     */
@property (nonatomic,assign) int    mbrank;

/**         会员类型   >2就是会员   */
@property (nonatomic,assign) int  mbtype;

@end
