//
//  NSString+Common.h
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

/**
 *	@brief	比较版本字符串
 *
 *	@param 	other 	需要对比的版本号
 *
 *	@return	NSOrderedAscending 表示大于指定版本 NSOrderedSame 表示两个版本相同  NSOrderedDescending 表示小于指定版本
 */
- (NSComparisonResult)versionStringCompare:(NSString *)other;

/**
 * @brief 判断是否是email地质
 * @param email 邮箱
 * @return BOOL YES,邮箱地址;NO,非邮箱地址
 */
- (BOOL)isEmailAddress:(NSString *)email;

/**
 * @brief 判断是否是数字输入
 * @param string 输入字符
 * @return BOOL YES,是;NO,不是
 */
- (BOOL)isNumber:(NSString *)input;

/**
 * @brief 判断是否是手机号
 * @param phone 手机号
 * @return BOOL YES,手机号;NO,不是手机号
 */
- (BOOL)isPhone:(NSString *)phone;

/**
 * @brief 去字符串空格
 * @param string 字符串
 * @return 字符串
 */
- (NSString *)stringByTrimming:(NSString *)string;

/**
 * @brief 判断两个字符串是否相等
 * @param one 字符串一
 * @param two 字符串二
 * @return BOOL YES,相等;NO,不想等
 */
- (BOOL)isEqual:(NSString *)one withTwo:(NSString *)two;

/**
 * @value 判断字符串是否为空
 * @param str 字符串
 * @return BOOL YES,非空;NO,是空
 */
- (BOOL)isEmpty:(NSString *)str;

/**
 * @brief 截取字符串
 * @param string 截取的字符串
 * @param oneTag 开始标示
 * @param twoTag 结束标示
 * @return NSString 截取后的字符串
 */
- (NSString *)subString:(NSString *)string from:(NSString *)oneTag to:(NSString *)twoTag;

/**
 * @brief 字符串转utf8编码
 * @param string 字符串
 * @return NSString 编码后的字符串
 */
- (NSString *)stringEncodingUTF8:(NSString *)string;

/**
 * @brief url处理，检查http://协议添加
 * @param string URL字符串
 * @return NSString 支持http://协议的string
 */
- (NSString *)stringAddingPrefixWithHttp:(NSString *)string;

/**
 * @brief 字符串处理，检查字符串是否按指定标示结尾
 * @param string 字符串
 * @param tag 标示
 * @return NSString 返回指定标示结尾的字符串
 */
- (NSString *)stringAddingSuffix:(NSString *)string withTAG:(NSString *)tag;

/**
 * @brief 字符串处理，检查字符串是否按指定标示开头
 * @param string 字符串
 * @param tag 标示
 * @return NSString 返回指定标示结尾的字符串
 */
- (NSString *)stringAddingPrefix:(NSString *)string withTAG:(NSString *)tag;

/**
 * @brief URL转编码
 * @param urlString URL字符串
 * @return NSString 编码后的URL字符串
 */
- (NSString *)stringEncodingForURLString:(NSString *)urlString;

@end
// add by liuc 2014.09.25
@interface NSString (dateString)
/**
 *  将string按照格式转成时间
 *
 *  @param string      需要转换的时间字符串
 *
 *  @return 特定时间字符串 如小于当前时间不到30分钟,返回@"刚刚"
 */
+(NSString *)stringFromDateString:(NSString *)string;
//只显示年月日
+(NSString *)stringFromDateString:(NSString *)string onlyYMD:(BOOL)only;
/**
 *  计算string的size
 *
 *  @param string 需计算size的string
 *  @param size   限定size,
 *  @param font   string的字体
 *
 *  @return string的真实size
 */
+ (CGSize)sizeForString:(NSString *)string constainSize:(CGSize)size font:(UIFont *)font;
/**
 *  是否中文字符
 *
 *  @param string 需要判断的字符串
 *
 *  @return 如果是中文则返回YES,否则返回NO;
 */
+ (BOOL)isChinese:(NSString*)string;
/**
 *  转化html标签
 */
+ (NSString *)filterHTML:(NSString *)html;

@end
