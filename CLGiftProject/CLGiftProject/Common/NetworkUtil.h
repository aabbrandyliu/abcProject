//
//  NetworkUtil.h
//  Play86
//
//  Created by FNT on 1/28/13.
//  Copyright (c) 2013 Play86. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Utils NetworkUtil
 * NetworkUtil－网络工具类，监测当前网络
 * @author liuzh
 */
@interface NetworkUtil : NSObject

/**
 * @brief 判断当前是否有网络
 * @return BOOL: YES,网络可用;NO,网络不可用
 */
+(BOOL)isNetwork;


+(BOOL)isWifi;
@end
