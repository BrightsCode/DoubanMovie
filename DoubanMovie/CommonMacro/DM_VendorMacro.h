//
//  DM_VendorMacro.h
//
//  Created by Bright Zhang on 17/7/14.
//  Copyright (c) 2014 Bright Zhang. All rights reserved.
//

/**
 *  存放的是第三方常量的宏定义
 *
 *  @since 1.0
 */


/**
 *  Umeng 移动统计的SDK
 *
 *  @since 1.0
 */
#define Umeng_Analytics_SDK @"53ec76cbfd98c5cea7004ab8"

/**
 *  Umeng 统计的渠道名字
 *
 *  @since 1.0
 */
#define Umeng_Analytics_ChannelName @"App Store"

/**
 *  Umeng 调试的参数
 *
 *  @since 1.0
 */
#ifdef DEBUG
#define Umeng_Analytics_LogEnabled @"YES"
#else
#define Umeng_Analytics_LogEnabled @"NO"
#endif