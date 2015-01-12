//
//  CLPredefine.h
//  CLGiftProject
//
//  Created by xd on 15/1/12.
//  Copyright (c) 2015年 CLCompany. All rights reserved.
//

#ifndef CLGiftProject_CLPredefine_h
#define CLGiftProject_CLPredefine_h

#define kScreenSize           [[UIScreen mainScreen] bounds].size

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#define __IPHONE_8_0_WY ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

//判断屏幕尺寸是否是4寸屏
#define iPhone_4inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 2.获得RGB颜色
#define SPColor(r, g, b) [UIColor colo rWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG

#define NSLog(...) NSLog(@"%s [Line %d] %@", __PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...) do { } while (0)
#endif

//RGB转UIColor（不带alpha值）
#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
