
#import "myStatus_ToolBar.h"
#import "myStatus_Model.h"

@interface myStatus_ToolBar()
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,strong) NSMutableArray *dividers;
@property (nonatomic,weak) UIButton *reweetBtn;
@property (nonatomic,weak) UIButton *commentBtn;
@property (nonatomic,weak) UIButton *attitudeBtn;
@end

@implementation myStatus_ToolBar


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.userInteractionEnabled=YES;
        self.image=[UIImage resizedImageWithName:@"timeline_card_bottom_background"];
        self.highlightedImage=[UIImage resizedImageWithName:@"timeline_card_bottom_background_highlighted"];
        
        //添加按钮
        self.reweetBtn=   [self setupBtnWithImage:@"timeline_icon_retweet" and_backImage:@"timeline_card_leftbottom_highlighted" and_title:@"转发"];
        self.commentBtn= [self setupBtnWithImage:@"timeline_icon_comment" and_backImage:@"timeline_card_middlebottom_highlighted" and_title:@"评论"];
        self.attitudeBtn= [self setupBtnWithImage:@"timeline_icon_unlike" and_backImage:@"timeline_card_rightbottom_highlighted" and_title:@"赞"];
        
        [self setupDriver];
        [self setupDriver];
    }
    return self;
}

-(NSMutableArray *)btns{
    if(_btns==nil){
        _btns=[NSMutableArray array];
    }return _btns;
}
-(NSMutableArray *)dividers{
    if(_dividers==nil){
        _dividers=[NSMutableArray array];
    }return _dividers;
}

-(void )setupDriver{
    UIImageView *drvider=  [[UIImageView alloc] init];
    drvider.image=[UIImage imageWithNamed:@"timeline_card_bottom_line"];
    [self addSubview:drvider];
    [self.dividers addObject:drvider];
}

-(UIButton * )setupBtnWithImage:(NSString *)images and_backImage:(NSString *)imageBG and_title:(NSString *)titles{
    UIButton *reweetBtn=[[UIButton alloc] init];
    [reweetBtn setImage:[UIImage imageWithNamed:images] forState:UIControlStateNormal];
    reweetBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [reweetBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    reweetBtn.adjustsImageWhenHighlighted=NO;
    [reweetBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
    [reweetBtn setTitle:titles forState:UIControlStateNormal];
    [reweetBtn  setBackgroundImage:[UIImage resizedImageWithName:imageBG] forState:UIControlStateHighlighted];
    [self addSubview:reweetBtn];
    [self.btns addObject:reweetBtn];
    return reweetBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    int btnCount=(int)self.btns.count;
    int imageDriv=(int)self.dividers.count;
    CGFloat dr_w=2;
    CGFloat btn_x=0,btn_y=0,btn_h=self.frame.size.height;
    CGFloat btn_w=(self.frame.size.width-imageDriv*dr_w)/btnCount;
    
    for (int i=0; i<btnCount; i++) {
        UIButton *btn=self.btns[i];
        btn_x=i*(btn_w+dr_w);
        btn.frame=CGRectMake(btn_x, btn_y, btn_w, btn_h);
    }
    
    CGFloat dr_x=0,dr_y=0,dr_h=btn_h;
    for (int i=0; i<imageDriv; i++) {
        UIImageView *btn=self.dividers[i];
        UIButton *btns=self.btns[i];
        dr_x=CGRectGetMaxX(btns.frame);
        btn.frame=CGRectMake(dr_x, dr_y, dr_w, dr_h);
    }
}


-(void)setStatus_model:(myStatus_Model *)status_model{
    _status_model=status_model;
    [self setUpBtnTilteText:@"转发" and_count:status_model.reposts_count and_btn:self.reweetBtn];
    [self setUpBtnTilteText:@"评论" and_count:status_model.comments_count and_btn:self.commentBtn];
    [self setUpBtnTilteText:@"赞" and_count:status_model.attitudes_count and_btn:self.attitudeBtn];
}

-(void)setUpBtnTilteText:(NSString *)orgText and_count:(int) count and_btn:(UIButton *)btn{
    if(count>0){
        NSString *titles=nil;
        if(count<100){
            titles=[NSString stringWithFormat:@"%d",count];
        }
        else{
            double countDouble=count/10000.0;
            titles=[NSString stringWithFormat:@"%.1f万",countDouble];
            titles=[titles stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }
        [btn setTitle:titles forState:UIControlStateNormal];
    }
    else {
        [self.reweetBtn setTitle:orgText forState:UIControlStateNormal];
    }
}




@end


















