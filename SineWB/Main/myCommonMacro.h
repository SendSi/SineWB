/** myButtomButton 这里的宏  */
#define picH_Ratio 0.7
#define tabBarButtonTitleColor (iOS7 ? [UIColor blackColor] :[UIColor whiteColor])
#define tabBarButtonTitleSelectColor (iOS7 ? myColor(234,103,7) :myColor(248,139,0))

/** myPhotos_View  */
#define  myPhotoH 70
#define  myPhotoW 70
#define myPhotoMargin 10
/** myStatusFrame  */
#define statusNameFont [UIFont systemFontOfSize:15]
#define statusTimeFont [UIFont systemFontOfSize:12]
#define statusSourceFont [UIFont systemFontOfSize:12]
#define statusContentFont [UIFont systemFontOfSize:12]

#define statusCellBorder 5
#define statusTableBorder 5

#define retweet_statusNameFont [UIFont systemFontOfSize:15]
#define retweet_statusTimeFont [UIFont systemFontOfSize:12]
#define retweet_statusSourceFont [UIFont systemFontOfSize:12]
#define retweet_statusContentFont [UIFont systemFontOfSize:12]

/** topButton  */
#define iconWidth 20

/** startOncePanel  */
#define  pageNumber 3

//写代码
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue]>=7.0)
#define NSLogs(...)  NSLog(__VA_ARGS__)
#define myColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define angleRadian(angle) ( (angle) /180.0 * M_PI)

