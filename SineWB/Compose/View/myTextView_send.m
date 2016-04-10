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
        myLabel.textAlignment=NSTextAlignmentLeft;
         [self insertSubview:myLabel atIndex:0];
        myLabel.font= self.font;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText) name:UITextViewTextDidChangeNotification object:self];
        
        //[myLabel sizeToFit];
    }
    return self;
}

-(void)changeText{
    if(self.text.length>0)
    {
        self.placeholderLabel.hidden=YES;
    }else{
        self.placeholderLabel.hidden=NO;
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder=[placeholder copy];
    self.placeholderLabel.text=placeholder;
    if(placeholder.length>0){
        self.placeholderLabel.hidden=NO;
        CGFloat x=5,y=8,w=self.frame.size.width-2*x ,h=self.frame.size.height-2*y;
        CGSize sizes=     [placeholder sizeWithFont:self.placeholderLabel.font constrainedToSize:CGSizeMake(w, h)];
        self.placeholderLabel.frame=CGRectMake(x, y, sizes.width    , sizes.height);
    }
    else{
        self.placeholderLabel.hidden=YES;
    }
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor=placeholderColor;
    self.placeholderLabel.textColor=placeholderColor;
}
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font=font;
    self.placeholder=self.placeholder;
}

@end
