//
//  DM_UtilsMacro.h
//
//  Created by Bright Zhang on 17/7/14.
//  Copyright (c) 2014 Bright Zhang. All rights reserved.
//

/*--------------------------------开发中常用到的宏定义--------------------------------------*/
#pragma mark - 根据版本的不同，定义NSText的相关替代方法

/**
 *  根据版本的不同，定义NSText的相关替代方法
 *
 *  @since 1.0
 */
#if  __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
# define LINE_BREAK_WORD_WRAP      NSLineBreakByWordWrapping
# define LINE_BREAK_WORD_TURNTAIL  NSLineBreakByTruncatingTail
# define LINE_BREAK_WORD_CWRAP     NSLineBreakByCharWrapping
# define LINE_BREAK_WORD_CLIP      NSLineBreakByClipping
# define LINE_BREAK_WORD_MTURUN    NSLineBreakByTruncatingMiddle
#else
# define LINE_BREAK_WORD_WRAP      UILineBreakModeWordWrap
# define LINE_BREAK_WORD_TURNTAIL  UILineBreakModeTailTruncation
# define LINE_BREAK_WORD_CWRAP     UILineBreakModeCharacterWrap
# define LINE_BREAK_WORD_CLIP      UILineBreakModeClip
# define LINE_BREAK_WORD_MTURUN    UILineBreakModeMiddleTruncation
#endif

/**
 *  根据不同的版本，定义NSText的居左、居右和居中
 *
 *  @since 1.0
 */
#if  __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
# define TEXT_ALIGN_LEFT      NSTextAlignmentLeft
# define TEXT_ALIGN_RIGHT     NSTextAlignmentRight
# define TEXT_ALIGN_CENTER    NSTextAlignmentCenter
#else
# define TEXT_ALIGN_LEFT      UITextAlignmentLeft
# define TEXT_ALIGN_RIGHT     UITextAlignmentRight
# define TEXT_ALIGN_CENTER    UITextAlignmentCenter
#endif

#pragma mark - 系统目录
#define kDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#pragma mark - ---------设备系统相关---------
/**
 *  判断是否是retina 屏幕
 *
 *  @since 1.0
 */
#define mRetina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
/**
 *  判断是否是iPhone 5
 *
 *  @since 1.0
 */
#define mIsiP5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
/**
 *  判断是否是iPad
 *
 *  @since 1.0
 */
#define mIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *  判断是否是iPhone
 *
 *  @since 1.0
 */
#define mIsiphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/**
 *  读取手机的iosSDK系统版本
 *
 *  @since 1.0
 */
#define mSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define systemVersionfloat   ([[[UIDevice currentDevice] systemVersion] floatValue])

/**
 *  读取手机的语言版本
 *
 *  @since 1.0
 */
#define mCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
/**
 *  读取App的版本号
 *
 *  @since 1.0
 */
#define mAPPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  以系统版本来判断是否是第一次启动，包括升级后启动
 *
 *  @since 1.0
 */
#define mFirstLaunch     mAPPVersion

/**
 *  判断是否为第一次运行，升级后启动不算是第一次运行
 *
 *  @since 1.0
 */
#define mFirstRun        @"firstRun"

#pragma mark - ----------某些方法简写-------
/**
 *  某些方法简写
 *
 *  @since 1.0
 */
#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

#pragma mark -  基本类型转换为NSNumber
#define mNSNumBool(bool) [NSNumber numberWithBool:bool]
#define mNSNumInt(int) [NSNumber numberWithInt:int]
#define mNSNumFloat(float) [NSNumber numberWithFloat:float]
#define mNSNumDouble(double) [NSNumber numberWithDouble:double]


#pragma mark -  加载图片
/**
 *  加载图片方法的简写
 *
 *  @since 1.0
 */
#define mImageByName(name)        [UIImage imageNamed:name]
#define mImageByPath(name, ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:ext]]
#define mImageByUrl(path)   [UIImage imageWithContentsOfFile:path]

#pragma mark -  以tag读取View
/**
 *  以tag读取View
 *
 *  @since 1.0
 */
#define mViewByTag(parentView, tag, Class)  (Class *)[parentView viewWithTag:tag]

#pragma mark -  读取Xib文件的类
/**
 *  读取Xib文件的类
 *
 *  @since 1.0
 */
#define mViewByNib(Class, owner) [[[NSBundle mainBundle] loadNibNamed:Class owner:owner options:nil] lastObject]

#pragma mark -  id对象与NSData之间转换
/**
 *  id对象与NSData之间转换
 *
 *  @since 1.0
 */
#define mObjectToData(object)   [NSKeyedArchiver archivedDataWithRootObject:object]
#define mDataToObject(data)     [NSKeyedUnarchiver unarchiveObjectWithData:data]

#pragma mark - 度弧度转换
/**
 *  度弧度转换
 *
 *  @since 1.0
 */
#define mDegreesToRadian(x)      (M_PI * (x) / 180.0)
#define mRadianToDegrees(radian) (radian*180.0) / (M_PI)

#pragma mark - 颜色转换
/**
 *  颜色转换
 *
 *  @since 1.0
 */
#define mRGBColor(r, g, b)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define mRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark - rgb颜色转换（16进制->10进制）
/**
 *  rgb颜色转换（16进制->10进制）
 *
 *  @since 1.0
 */
#define mRGBToColor(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

/**
 *  StautsBar 的高度
 *
 *  @since 1.0
 */
#define mStautsBarHeight         20
/**
 *  NavgationBar 的高度
 *
 *  @since 1.0
 */
#define mNavBarHeight         44

/**
 *  Tabbar 的高度
 *
 *  @since 1.0
 */
#define mTabBarHeight         49

/**
 *  屏幕的宽度
 *
 *  @since 1.0
 */
#define mScreenWidth          ([UIScreen mainScreen].bounds.size.width)

/**
 *  屏幕的高度
 *
 *  @since 1.0
 */
#define mScreenHeight         ([UIScreen mainScreen].bounds.size.height)

/**
 *  页面背景颜色
 *
 *  @since 1.0
 */
#define mBackGroundColor [UIColor whiteColor]

/**
 *  设置navigation Bar 的背景图片颜色
 *
 *
 *  @since 1.0
 */
#define kNavbarAndTabbarBgImage [GeneralMethods createImageWithColor:[UIColor colorWithRed:138.0/255.0 green:205.0/255.0 blue:77.0/255.0 alpha:1.0]]