//
//  H&T_GeneralMethods.h
//
//  Created by Bruce Zhang on 17/4/14.
//  Copyright (c) 2014 Bruce Zhang. All rights reserved.
//

/**
 *  此文件里的方法是系统通用的方法
 *
 *  @since 1.0
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GeneralMethods : NSObject

/**
 *  计算UIView控件Y坐标和高度的和
 *
 *  @param view uiview
 *
 *  @return 坐标Y和高度的和
 *
 *  @since 1.0
 */
+(float)handlerView_Y_And_Height:(UIView *)view;

/**
 *  计算UIView控件X坐标和宽度的和
 *
 *  @param view uiview
 *
 *  @return 坐标X和宽度的和
 *
 *  @since 1.0
 */
+(float)handlerView_X_And_Width:(UIView *)view;

/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  对输入的字符串进行是否为空验证
 *
 *  @param str         需要进行验证的字符串
 *  @param warningText 警告文本，如果为空，则显示
 *
 *  @return 字符串如果为空，则返回NO，否则返回YES
 *
 *  @since 1.0
 */
+(BOOL)validateStringIsNull:(NSString *)str WarningText:(NSString *)warningText;

/**
 *  用正则表达式对输入的字符串进行合法检测
 *
 *  @param trimmedString 需要检测的字符串
 *  @param regex         进行匹配的正则表达式
 *  @param warningText   警告文本，如果不合法，则显示
 *
 *  @return 如果合法，返回YES,否则返回NO
 *
 *  @since 1.0
 */
+(BOOL)validateStringIsRight:(NSString *)trimmedString andRegexString:(NSString *)regex;

/*!
 *  检查对象是否是一个字典
 *
 *  @param mArray 需要检查的对象
 *
 *  @return 是否是一个字典
 *
 *  @since 1.0
 */

+(BOOL)isNSDictionary:(id)mDictionary;

/*!
 *  检查对象是否是一个数组
 *
 *  @param mArray 需要检查的对象
 *
 *  @return 是否是一个数组
 *
 *  @since 1.0
 */
+(BOOL)isNSArray:(id)mArray;

/**
 *  检查字符串Object 是否为空，如果为<null>等，则统一为@""
 *
 *  @param object 需要检查的字符串
 *
 *  @return 返回修改好的字符串
 *
 *  @since 1.0
 */
+(NSString *)checkPostObject:(NSString *)object;

/**
 *  判断手机号格式是否正确
 *
 *  @param trimmedString 传入字符串
 *  @param warningText   警告文本
 *
 *  @return YES，格式正确；NO，格式不正确
 *
 *  @since 1.0
 */
+(BOOL)validateStringISPhoneNumber:(NSString *)trimmedString;

/**
 *  判断邮箱格式是否正确
 *
 *  @param trimmedString 传入字符串
 *
 *  @return YES，格式正确；NO，格式不正确
 *
 *  @since 1.0
 */
+(BOOL)validateStringISEmail:(NSString *)trimmedString;

/**
 *  通用的警告框提示
 *
 *  @param title       警告框的Title
 *  @param message     警告框的内容
 *  @param cancelTitle 取消按钮的名字
 *
 *  @since 1.0
 */
+(void)alertFormatofTitle:(NSString *)title withMessage:(NSString *)message withCancelBtnTitle:(NSString *)cancelTitle;

/**
 *  根据RGB返回UIColor。
 *  @param  red、green、blue:范围0—255。
 *  @param  alpha:透明度。
 *  return  UIColor。
 */
+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

/**
 *  根据UIColor返回RGB数组。
 *  @param  color:传递的参数。
 *  return  RGB数组
 */
+ (NSArray *)convertColorToRBG:(UIColor *)color;

/**
 *  根据十六进制颜色值返回UIColor。
 *  @param  hexColor:十六进制颜色值。
 *  return  UIColor。
 */
+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor;

 /**
 *  colorInHex should be value like 0xFFFFFF
 *  @param  hexColor:十六进制颜色值。
 *  return  UIColor。
 */
+ (UIColor *)UIColorFromHex:(NSInteger)colorInHex;

/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+(NSString *) compareCurrentTime:(NSDate*) compareDate;

/**
 *  将image转90,180,270度的方法
 *
 *  @param image       传入uiimage
 *  @param orientation image 的 旋转角度
 *
 *  @return 返回已经转好的uiimage
 */
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

/**
 *  将image压缩为800x598的大小，
 *
 *  @param image       传入uiimage
 
 *  @return 返回已经转好的uiimage
 */
+(UIImage *)scaleImage:(UIImage *)image;


/**
 *  判断文件夹是否存在，
 *
 *  @param path       传入文件夹名称
 
 *  @return bool 返回文件夹是否存在
 */
+(BOOL)isExistFile:(NSString *)path;

/**
 *  绘制view的边界，Test方法使用
 *
 *
 *  @since 1.0
 */
+(void)viewBoderOfTest:(UIView *)view;


/**
 *  根据字数的不同决定size的大小
 *
 *  @since 1.0
 */
+(CGSize)boundingRectWithSize:(CGSize)size withText:(NSString *)text withfont:(UIFont *)font;
/*!
 *  获取共享文件夹的路径
 *
 *  @param filePath 文件名称
 *
 *  @return 带共享文件夹的文件路径
 *
 *  @since 1.0
 */
+(NSString*)shareFilePath:(NSString*)filePath;

/*!
 *  获取原始图的URL
 *
 *  @param url 剪切图的URL
 *
 *  @return 原始图的URL
 *
 *  @since 1.0
 */
+(NSString*)sortImageUrl:(NSString*)url;

/*!
 *  获取字符串的size
 *
 *  @param aString 原始字符串
 *
 *  @return 字符串的size
 *
 *  @since 1.0
 */
+ (CGSize)getStringRect:(NSString*)aString;

+ (CGSize)getStringRect:(NSString*)aString withSize:(CGSize)mSize;

/*!
 *  压缩图片尺寸
 *
 *  @param img  原始图片
 *  @param size 要压缩到的尺寸
 *
 *  @return 压缩好的图片
 *
 *  @since 1.0
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
/*!
 *  生成URL链接
 *
 *  @param url 原始url
 *
 *  @return 生成的URL
 *
 *  @since 1.0
 */
+(NSURL*)makeURL:(NSString*)url;

/**
 *  格式化时间
 *
 *  @since 1.0
 */
+(NSString *)getDateWithStr:(NSString *)str;

/**
 *  截取字符串
 *
 *  @param str 传入str
 *
 *  @return 返回str
 *
 *  @since 1.0
 */
+(NSString *)getStrFromStr:(NSString *)str withIndex:(NSInteger )index;


/*!
 *  剪切图片
 *
 *  @param image      原始图片
 *  @param mCGRect    需要的尺寸
 *  @param centerBool 是否居中剪切
 *
 *  @return 剪切后图片
 *
 *  @since 1.0
 */
+(UIImage*)getSubImage:(UIImage *)image mCGRect:(CGRect)mCGRect centerBool:(BOOL)centerBool;
@end
