//
//  UIColor+Common.h
//  MoJiEnt
//
//  Created by liu on 14-4-1.
//  Copyright (c) 2014年 moji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

/**
 *	@brief	获取颜色对象
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithString:(NSString *)string;
@end
