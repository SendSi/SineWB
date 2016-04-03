//
//  myStatusCell.h
//  SineWB
//
//  Created by scuplt on 16-3-31.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  myStatusFrame;
@interface myStatusCell : UITableViewCell
/**  myStatusFrame 类的    */
@property (nonatomic,strong) myStatusFrame *statusFrame;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
