//
//  H&T_GeneralMethods.m
//  D
//
//  Created by Bruce Zhang on 17/4/14.
//  Copyright (c) 2014 Bruce Zhang. All rights reserved.
//

#import "GeneralMethods.h"

@implementation GeneralMethods

+(NSString*)shareFilePath:(NSString*)filePath
{    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent: filePath];
}


+(float)handlerView_Y_And_Height:(UIView *)view
{
    float yHeight = 0;
    if (view != nil)
    {
        yHeight = view.frame.origin.y + view.frame.size.height;
    }
    
    return yHeight;
}


+(float)handlerView_X_And_Width:(UIView *)view
{
    float xWidth = 0;
    if (view != nil)
    {
        xWidth = view.frame.origin.x + view.frame.size.width;
    }
    
    return xWidth;
}

/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 *  对输入的字符串进行是否为空验证
 *
 *  @param str         需要进行验证的字符串
 *  @param warningText 警告文本，如果为空，则显示
 *
 *  @return 字符串不为空，则返回YES，否则返回NO
 *
 *  @since 1.0
 */
+(BOOL)validateStringIsNull:(NSString *)str WarningText:(NSString *)warningText
{
    if ([str isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:warningText
                                   delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil] show];
        return NO;
    }
    return YES;
    
}
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

+(BOOL)validateStringIsRight:(NSString *)trimmedString andRegexString:(NSString *)regex
{
    NSPredicate *predicateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([predicateTest evaluateWithObject:trimmedString]){
        return NO;
    }
    else
    {
        return YES;
    }
    
}

+(BOOL)validateStringISPhoneNumber:(NSString *)trimmedString
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8|7[09])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:trimmedString];
    BOOL res2 = [regextestcm evaluateWithObject:trimmedString];
    BOOL res3 = [regextestcu evaluateWithObject:trimmedString];
    BOOL res4 = [regextestct evaluateWithObject:trimmedString];
    
    if (res1 || res2 || res3 || res4 )
    {
        
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)validateStringISEmail:(NSString *)trimmedString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:trimmedString];
}

+(NSString *)checkPostObject:(id)object
{
    if ([object isEqual:[NSNull class]])
    {
        return [NSString stringWithFormat:@""];
    }else if([object isKindOfClass:[NSNull class]])
    {
        return [NSString stringWithFormat:@""];
    }else
    {
        if (object == nil || [object isEqualToString:@"<null>"] || [object isEqualToString:@"(null)"])
        {
            return [NSString stringWithFormat:@""];
        }
        return object;
    }
    return [NSString stringWithFormat:@""];

}

+(BOOL)isNSDictionary:(id)mDictionary;
{
    if (mDictionary && [mDictionary isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}


+(BOOL)isNSArray:(id)mArray;
{
    if (mArray && [mArray isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

+(void)alertFormatofTitle:(NSString *)title withMessage:(NSString *)message withCancelBtnTitle:(NSString *)cancelTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}
+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
    return color;
}

+ (NSArray *)convertColorToRBG:(UIColor *)uicolor
{
    CGColorRef color  = [uicolor CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    NSArray *array = nil;
    
    if (numComponents == 4)
    {
        int rValue, gValue, bValue;
        const CGFloat *components = CGColorGetComponents(color);
        rValue = (int)(components[0] * 255);
        gValue = (int)(components[1] * 255);
        bValue = (int)(components[2] * 255);
        
        array = [NSArray arrayWithObjects:[NSNumber numberWithInt:rValue], [NSNumber numberWithInt:gValue], [NSNumber numberWithInt:bValue], nil];
    }
    
    return array;
}

+ (UIColor *)UIColorFromHex:(NSInteger)colorInHex
{
    // colorInHex should be value like 0xFFFFFF
    return [UIColor colorWithRed:((float) ((colorInHex & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((colorInHex & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (colorInHex & 0xFF))            / 0xFF
                           alpha:1.0];
}

+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor
{
    return [UIColor colorWithRed:((float) ((hexColor & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((hexColor & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (hexColor & 0xFF))            / 0xFF
                           alpha:1.0];
}


/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+(NSString *) compareCurrentTime:(NSDate*) compareDate
//
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval =  [[NSDate date] timeIntervalSinceNow] - timeInterval;
    int temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%d分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%d小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%d天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%d月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%d年前",temp];
    }
    
    return  result;
}

/**
 *  将image转90,180,270度的方法
 *
 *  @param image       传入uiimage
 *  @param orientation image 的 旋转角度
 *
 *  @return 返回已经转好的uiimage
 */
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

/**
 *  将image压缩为800x598的大小，
 *
 *  @param image       传入uiimage
 
 *  @return 返回已经转好的uiimage
 */
+(UIImage *)scaleImage:(UIImage *)image
{
    CGSize size = CGSizeMake(800, 598);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


+(BOOL)isExistFile:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if(!(isDirExist && isDir)){
        return false;
    }
    return true;
}


+(void)viewBoderOfTest:(UIView *)view
{
//    if(DEV_TEST)
    {
        view.layer.borderColor = [UIColor redColor].CGColor;
        view.layer.borderWidth = 1;
    }
}

+(CGSize)boundingRectWithSize:(CGSize)size withText:(NSString *)text withfont:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize retSize = [text boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}

+(NSString*)sortImageUrl:(NSString*)url
{
    NSArray* items = [url componentsSeparatedByString:@".JPG"];
    if (items.count < 2) {
        items = [url componentsSeparatedByString:@".jpg"];
    }
    if (items.count < 2) {
        return url;
    }
    
    NSString* result = items[items.count- 2];
    result =  [result substringToIndex:[result length]-2];
    result = [result stringByAppendingString:@".jpg"];
    return result;
}


+ (CGSize)getStringRect:(NSString*)aString
{
    CGSize size;
    if (!aString) {
        return CGSizeMake(0, 0);
    }
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:aString];
    
    NSRange range = NSMakeRange(0, atrString.length);
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    if ([mSystemVersion floatValue] >= 7.0) {
        CGSize mSize =  CGSizeMake(150, 200);
        size = [aString boundingRectWithSize:mSize  options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    }else
    {
      size = [atrString size];
    }
    return  size;
}


+ (CGSize)getStringRect:(NSString*)aString withSize:(CGSize)mSize
{
    CGSize size;
    if (!aString) {
        return CGSizeMake(0, 0);
    }
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:aString];
    
    NSRange range = NSMakeRange(0, atrString.length);
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    if ([mSystemVersion floatValue] >= 7.0) {
//        CGSize mSize =  CGSizeMake(200, 200);
        size = [aString boundingRectWithSize:mSize  options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    }else
    {
        size = [atrString size];
    }
    return  size;
}


+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    CGSize imgSize = img.size;
    if (imgSize.width * imgSize.height < 480000) {
        return img;
    }
    
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}
+(NSURL*)makeURL:(NSString*)url;
{
    if (![url hasPrefix:@"http"]) {
        url = [API_BaseImage_URL stringByAppendingString:url];
    }
    return [NSURL URLWithString:url];
}

+(NSString *)getDateWithStr:(NSString *)str
{
    if ([str isEqualToString:@""]) {
        return @"";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *getDate = [dateFormatter dateFromString:str];
    [dateFormatter setDateFormat:@"YYYY年MM月dd日 HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:getDate];
    
    return dateString;
}

+(NSString *)getStrFromStr:(NSString *)str withIndex:(NSInteger )index
{
    NSString *strBack;
    if (str.length > index) {
        strBack = [NSString stringWithFormat:@"%@...",[str substringToIndex:index]];
    }
    else
    {
        strBack = str;
    }
    return strBack;
}
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
+(UIImage*)getSubImage:(UIImage *)image mCGRect:(CGRect)mCGRect centerBool:(BOOL)centerBool
{
    
    /*如若centerBool为Yes则是由中心点取mCGRect范围的图片*/
    
    
    float imgwidth = image.size.width;
    float imgheight = image.size.height;
    float viewwidth = mCGRect.size.width;
    float viewheight = mCGRect.size.height;
    CGRect rect;
    if(centerBool)
        rect = CGRectMake((imgwidth-viewwidth)/2, (imgheight-viewheight)/2, viewwidth, viewheight);
    else{
        if (viewheight < viewwidth) {
            if (imgwidth <= imgheight) {
                rect = CGRectMake(0, 0, imgwidth, imgwidth*viewheight/viewwidth);
            }else {
                float width = viewwidth*imgheight/viewheight;
                float x = (imgwidth - width)/2 ;
                if (x > 0) {
                    rect = CGRectMake(x, 0, width, imgheight);
                }else {
                    rect = CGRectMake(0, 0, imgwidth, imgwidth*viewheight/viewwidth);
                }
            }
        }else {
            if (imgwidth <= imgheight) {
                float height = viewheight*imgwidth/viewwidth;
                if (height < imgheight) {
                    rect = CGRectMake(0, 0, imgwidth, height);
                }else {
                    rect = CGRectMake(0, 0, viewwidth*imgheight/viewheight, imgheight);
                }
            }else {
                float width = viewwidth*imgheight/viewheight;
                if (width < imgwidth) {
                    float x = (imgwidth - width)/2 ;
                    rect = CGRectMake(x, 0, width, imgheight);
                }else {
                    rect = CGRectMake(0, 0, imgwidth, imgheight);
                }
            }
        }
    }
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}


@end
