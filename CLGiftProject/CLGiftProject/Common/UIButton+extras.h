//
//  UIButton+extras.h
//  extentions
//
//  Created by zngoo mac on 14-7-11.
//  Copyright (c) 2014年 Randy liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extras)


+ (UIButton *)customButtonWithFrame:(CGRect)frame
                               title:(NSString *)title
                      backgroudColor:(UIColor *)color
                              target:(id)target
                            selector:(SEL)selector;

//便利方法自定义按钮
+ (instancetype)createButtonWithFrame:(CGRect)frame
                               target:(id)target
                             selector:(SEL)selector
                                image:(UIImage *)image
                         imagePressed:(UIImage *)imagePres
                                title:(NSString *)title
                           isDarkText:(BOOL)isDark;

@end
