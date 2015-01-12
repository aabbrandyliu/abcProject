//
//  NSDate+Common.m
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)

+(NSString *)nowDateString{
    NSDateFormatter *inputFormatter = nil;
    if (!inputFormatter) {
        inputFormatter = [[NSDateFormatter alloc] init];
    }
    [inputFormatter setDateFormat:kDateFormat];
	return [inputFormatter stringFromDate:[ NSDate date]];
}

+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *inputFormatter = nil;
    if (!inputFormatter) {
        inputFormatter = [[NSDateFormatter alloc] init];
    }
    [inputFormatter setDateFormat:kDateFormat];
    return [inputFormatter dateFromString:dateString];
}

+(NSString *)dateToString:(NSDate *)newDate format:(NSString *)format{
    NSDateFormatter *inputFormat = nil;
    if (!inputFormat) {
        inputFormat = [[NSDateFormatter alloc] init];
    }
    [inputFormat setDateFormat:format];
    return [inputFormat stringFromDate:newDate];
}
@end
