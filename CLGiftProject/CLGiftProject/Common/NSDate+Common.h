//
//  NSDate+Common.h
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDateFormat @"yyyy-MM-dd hh:mm:ss"

@interface NSDate (Common)

/**
 *	@brief	获取当前时间的字符串
 *
 *	@return	date string
 */
+(NSString *)nowDateString;

+(NSDate *)dateFromString:(NSString *)dateString;
+(NSString *)dateToString:(NSDate *)newDate format:(NSString *)format;

////计算时间差(用于初始时间是格林威治时间)
//+(NSString *)intervalSinceNow: (NSString *) aDate;
////获取生日－提供UI数据显示－
//+(NSString *)birthdayString: (NSDate *) aDate;
////获取带星期的时间
//+(NSString *)dateAndWeek:(NSDate *)aDate;
////生成生日－提供数据库存储－
//+(NSString *)generateBirthday:(NSDate *)date;
////从时间字符串中获取年月日
//+(NSString *)dateForString:(NSString *)date;
@end
