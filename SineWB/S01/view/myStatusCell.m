#import "myStatusCell.h"
#import "myStatusFrame.h"
#import "myStatus_Model.h"
#import "myUser_Model.h"
#import "UIImageView+WebCache.h"
#import "myStatus_ToolBar.h"
#import "myReweetStatusView.h"
#import "myTopStatusView.h"

@interface myStatusCell()
/** 顶部的view  */
@property (nonatomic,weak) myTopStatusView *topView;

/** 微博 工具条        */
@property (nonatomic,weak) myStatus_ToolBar *statusToolBar;
@end

@implementation myStatusCell
#pragma mark -UI方面
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ids=@"status";
    myStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:ids];
    if(cell==nil)
        cell=[[myStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ids];
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //topView UI的 显示
        [self setupTopView_UI];
        //添加 微博的工具条
        [self setupStatusToolbar_UI];
    }
    return self;
}
/** topView UI的 显示  */
-(void)setupTopView_UI{
    self.selectedBackgroundView=[[UIView alloc] init];
    
    myTopStatusView *topView= [[myTopStatusView alloc] init];
    [self.contentView addSubview:topView];
    self.topView=topView;
    topView.image=[UIImage resizedImageWithName:@"timeline_card_top_background"];
    topView.highlightedImage=[UIImage resizedImageWithName:@"timeline_card_top_background_highlighted"];
}


/** 添加 微博的工具条  */
-(void )setupStatusToolbar_UI{
    myStatus_ToolBar *statusToolbar=[[myStatus_ToolBar alloc ] init];
    [self.contentView addSubview:statusToolbar];
    self.statusToolBar=statusToolbar;
}

#pragma mark -在重写frame中 设置数据源
-(void)setFrame:(CGRect)frame{
    frame.origin.y+=statusTableBorder;
    frame.origin.x=statusTableBorder;
    frame.size.width-=2*statusTableBorder;
    frame.size.height-=statusTableBorder;
    [super setFrame:frame];
}


/**  模型数据 Frame  */
-(void)setStatusFrame:(myStatusFrame *)statusFrame{
    _statusFrame=statusFrame;
    //微博 topview
    [self setupTopView_Data];
    //微博工具条
    [self setupStatusToolbar_Data];
}

/** *  微博工具条 */
- (void)setupStatusToolbar_Data
{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.status_model=self.statusFrame.status;
}
/**  微博 topview   */
-(void)setupTopView_Data{
    self.topView.frame=self.statusFrame.topViewF;
         //这里传递 statusframe的值
    self.topView.statusFrame=self.statusFrame;
}



@end













