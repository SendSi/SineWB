//
//  myPhotos_View.m
//  SineWB
//
//  Created by scuplt on 16-4-4.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//
#import "myPhotos_View.h"
#import "myPhoto_View.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "myPhotos_model.h"

@implementation myPhotos_View

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        for (int i=0; i<9; i++) {
            myPhoto_View *photo_View=[[myPhoto_View alloc] init];
            photo_View.userInteractionEnabled=YES;
            photo_View.tag=i;//tag得到索引
            [photo_View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTap:)]] ;
            [self addSubview:photo_View];
        }
    }
    return self;
}

-(void)photoTap:(UITapGestureRecognizer *)recognizer{
//    recognizer.view.tag
    int count=(int)self.photos.count;//图片总数
    
    NSMutableArray *myphotos=[NSMutableArray arrayWithCapacity:count];//Capacity数组容量
    for(int i=0;i<count;i++)
    {
        //一个mjPhoto对应一张显示的图片
        MJPhoto *mjphoto=[[MJPhoto alloc] init];
        mjphoto.srcImageView=self.subviews[i];//来源于哪个UIImageView
        myPhotos_model *iwphoto=self.photos[i];
        NSString *str=[iwphoto.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        mjphoto.url=[NSURL URLWithString:str];
        [myphotos addObject:mjphoto];        
    }
    MJPhotoBrowser *browser=[[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex=recognizer.view.tag;
    browser.photos=myphotos;
    [browser show];
 }

-(void)setPhotos:(NSArray *)photos{
    _photos=photos;
    for (int i=0; i<self.subviews.count; i++) {
        myPhoto_View *photoView=self.subviews[i];
        if(i<photos.count){
            // 显示图片
            photoView.hidden = NO;
            
            // 传递模型数据
            photoView.photo = photos[i];
            
            // 设置子控件的frame
            int maxColumns = (photos.count == 4) ? 2 : 3;
            int col = i % maxColumns;
            int row = i / maxColumns;
            CGFloat photoX = col * (myPhotoW + myPhotoMargin);
            CGFloat photoY = row * (myPhotoH + myPhotoMargin);
            photoView.frame = CGRectMake(photoX, photoY, myPhotoW, myPhotoH);
            
            // Aspect : 按照图片的原来宽高比进行缩
            // UIViewContentModeScaleAspectFit : 按照图片的原来宽高比进行缩放(一定要看到整张图片)
            // UIViewContentModeScaleAspectFill :  按照图片的原来宽高比进行缩放(只能图片最中间的内容)
            // UIViewContentModeScaleToFill : 直接拉伸图片至填充整个imageView
            
            if (photos.count == 1) {
                photoView.contentMode = UIViewContentModeScaleAspectFit;
                photoView.clipsToBounds = NO;
            } else {
                photoView.contentMode = UIViewContentModeScaleAspectFill;
                photoView.clipsToBounds = YES;
            }
        } else { // 隐藏imageView
            photoView.hidden = YES;
        }
    }
}

+(CGSize) photosViewSizeWithPhotosCount:(int) count{
    //一行最多有 3列
    int maxColumns=(count==4)?2:3;
    //总行数
    int rows=(count+maxColumns-1)/maxColumns;
    //高度
    CGFloat photosH=rows*myPhotoH   +(rows-1)*myPhotoMargin;
    //总列数
    int cols=(count>=maxColumns)?maxColumns:count;
    //宽度
    CGFloat photosW=cols*myPhotoW+(cols-1)*myPhotoMargin;
    return CGSizeMake(photosW, photosH);
    /**
     一共60条数据 == count
     一页10条 == size
     总页数 == pages
     pages = (count + size - 1)/size;
     */
}

@end













