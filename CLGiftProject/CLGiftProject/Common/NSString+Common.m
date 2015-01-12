//
//  NSString+Common.m
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import "NSString+Common.h"

#define kDate_Formatter         @"EEE MMM d HH:mm:ss Z yyyy"

@implementation NSString (Common)

- (NSComparisonResult)versionStringCompare:(NSString *)other{
    return [self compare:other options:NSLiteralSearch | NSNumericSearch];
}

- (BOOL)isEmailAddress:(NSString *)email{
    NSString *cleanEmail = [email stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:cleanEmail];
}

- (BOOL)isNumber:(NSString *)input{
    NSString *cleanNum = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *numRegex = @"^[0-9]+(.[0-9])?$";
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    return [numTest evaluateWithObject:cleanNum];
}

- (BOOL)isPhone:(NSString *)phone{
    if (![self isEmpty:phone]) {
        return NO;
    }
    NSString *cleanPhone = [phone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *regex = @"(\\+86|86|0086)?((13[0-9]|15[0-35-9]|14[57]|18[0-9])\\d{8})";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:cleanPhone];
    return isMatch;
}

- (NSString *) stringByTrimming:(NSString *)string{
    if (![self isEmpty:string]) {
        return nil;
    }
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isEqual:(NSString *)one withTwo:(NSString *)two{
    if (![self isEmpty:one]) {
        return NO;
    }
    if (![self isEmpty:two]) {
        return NO;
    }
    NSString *cleanOne = [one stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *cleanTwo = [two stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [cleanOne isEqualToString:cleanTwo];
}

- (BOOL)isEmpty:(NSString *)str{
    if (!str) {
        return NO;
    }
    if ([@"" isEqualToString:str]) {
        return NO;
    }
    return YES;
}

- (NSString *)subString:(NSString *)string from:(NSString *)oneTag to:(NSString *)twoTag{
    if (![self isEmpty:string]) {
        return @"";
    }
    NSRange range1 = [string rangeOfString:oneTag];
    NSString *result1 = [string substringFromIndex:range1.location + 1];
    NSRange range2 = [result1 rangeOfString:twoTag];
    NSString *result2 = [result1 substringToIndex:range2.location];
    return result2;
}

- (NSString *)stringEncodingUTF8:(NSString *)string{
    if ([self isEmpty:string]) {
        return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)stringAddingPrefixWithHttp:(NSString *)string{
    if ([self isEmpty:string]) {
        if ([string hasPrefix:@"http://"]) {
            return string;
        }else{
            return [NSString stringWithFormat:@"http://%@",string];
        }
    }
    return nil;
}

- (NSString *)stringAddingSuffix:(NSString *)string withTAG:(NSString *)tag{
    if ([self isEmpty:string] && [self isEmpty:tag]) {
        if ([string hasSuffix:tag]) {
            return string;
        }else{
            return [NSString stringWithFormat:@"%@%@",string,tag];
        }
    }
    return nil;
}

- (NSString *)stringAddingPrefix:(NSString *)string withTAG:(NSString *)tag{
    if ([self isEmpty:string] && [self isEmpty:tag]) {
        if ([string hasPrefix:tag]) {
            return string;
        }else{
            return [NSString stringWithFormat:@"%@%@",tag,string];
        }
    }
    return nil;
}

- (NSString *)stringEncodingForURLString:(NSString *)urlString{
    if ([self isEmpty:urlString]) {
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data =[NSData dataWithContentsOfURL:url];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUnicode);
        return [[NSString alloc]initWithData:data encoding:enc];
    }
    return nil;
}

@end

@implementation NSString (dateString)

+ (NSString *)dateStringByString:(NSString *)dateString dateFormat:(NSString *)formatterString
{
    long long date = [dateString longLongValue];
    
    NSDate *d = [[NSDate alloc] initWithTimeIntervalSince1970:date/1000.0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:formatterString];
    
    NSString *string = [formatter stringFromDate:d];
    
    return string;
}

+(NSString *)stringFromDateString:(NSString *)string
{
    NSString *timeStr = [self stringFromDateString:string onlyYMD:NO];
    
    return timeStr;
    /*
    // 1.获得微博的发送时间
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = kDate_Formatter;
    NSString *lastDate = [NSString dateStringByString:string dateFormat:kDate_Formatter];
    
    NSDate *send = [fmt dateFromString:lastDate];
    
    // 3.获得当前时间和发送时间 的 间隔  (now - send)
    NSString *timeStr = nil;
    // NSTimeInterval delta = [now timeIntervalSinceDate:send];
    NSTimeInterval delta = -[send timeIntervalSinceNow];
    if (delta < 60) { // 一分钟内
        timeStr = @"刚刚";
    } else if (delta < 60 * 60) { // 一个小时内
        timeStr = [NSString stringWithFormat:@"%.f分钟前", delta/60];
    } else if (delta < 60 * 60 * 24) { // 一天内
        timeStr = [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else { // 几天前
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        timeStr = [fmt stringFromDate:send];
    }
    
    return timeStr;
     */
}

+(NSString *)stringFromDateString:(NSString *)string onlyYMD:(BOOL)only
{
    // 1.获得微博的发送时间
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = kDate_Formatter;
    NSString *lastDate = [NSString dateStringByString:string dateFormat:kDate_Formatter];
    
    NSDate *send = [fmt dateFromString:lastDate];
    
    // 3.获得当前时间和发送时间 的 间隔  (now - send)
    NSString *timeStr = nil;
    NSString *fMatter = nil;
    // NSTimeInterval delta = [now timeIntervalSinceDate:send];
    NSTimeInterval delta = -[send timeIntervalSinceNow];
    if (delta < 60) { // 一分钟内
        timeStr = @"刚刚";
    } else if (delta < 60 * 60) { // 一个小时内
        timeStr = [NSString stringWithFormat:@"%.f分钟前", delta/60];
    } else if (delta < 60 * 60 * 24) { // 一天内
        timeStr = [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else { // 几天前
        if (!only) {
            fMatter = @"yyyy-MM-dd HH:mm";
        } else {
            fMatter = @"yyyy-MM-dd";
        }
        fmt.dateFormat = fMatter;
        timeStr = [fmt stringFromDate:send];
    }
    
    return timeStr;
}

+ (CGSize)sizeForString:(NSString *)string constainSize:(CGSize)size font:(UIFont *)font
{
    string = (string == nil || [(NSNull *)string isKindOfClass:[NSNull class]] ? @"":[NSString stringWithFormat:@"%@",string]);
    
    if (![string isEqualToString:@""]) {
        
        CGSize sizeFrame =[string sizeWithFont:font
                             constrainedToSize:size
                                 lineBreakMode:NSLineBreakByWordWrapping];
        
        return sizeFrame;
    }
    
    return CGSizeZero;
}

+ (BOOL)isChinese:(NSString*)c{
    
    BOOL is = NO;
    
    int length = [c length];
    
    for (int i=0; i<length; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [c substringWithRange:range];
        const char    *cString = [subString UTF8String];
        if (strlen(cString) == 3)
        {
            return YES;
        }
    }
    return is;
}

+ (NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

@end

