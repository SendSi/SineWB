//
//  myTextView_send.m
//  SineWB
//
//  Created by scuplt on 16-4-7.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myTextView_send.h"
@interface myTextView_send()
@property (nonatomic,weak) UILabel *placeholderLabel;
@end


@implementation myTextView_send

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        UILabel *myLabel=[[UILabel alloc] init];
        myLabel.textColor=[UIColor lightGrayColor];
        myLabel.hidden=YES;
 
        [self addSubview:myLabel];
        self.placeholderLabel=myLabel;

    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
        CGFloat x=5,y=7,w=self.frame.size.width-2*x ,h=self.frame.size.height-2*y;
        self.placeholderLabel.frame=CGRectMake(x, y, w, h);
}

-(void)setPlaceholder:(NSString *)placeholder{
    self.placeholderLabel.text=placeholder;
    if(placeholder.length>0){
        self.placeholderLabel.hidden=NO;
    }
    else{
        self.placeholderLabel.hidden=YES;
    }
}

@end
