//
//  UIButton+extras.m
//  extentions
//
//  Created by zngoo mac on 14-7-11.
//  Copyright (c) 2014年 Randy liu. All rights reserved.
//

#import "UIButton+extras.h"

@implementation UIButton (extras)

+ (UIButton *)customButtonWithFrame:(CGRect)frame
                               title:(NSString *)title
                      backgroudColor:(UIColor *)color
                              target:(id)target
                            selector:(SEL)selector
{
    UIButton  *verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    verifyButton.frame= frame;
    verifyButton.backgroundColor = color;
    verifyButton.layer.cornerRadius = 3;
    [verifyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [verifyButton setTitle:title forState:UIControlStateNormal];
    [verifyButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    verifyButton.titleLabel.font = [UIFont systemFontOfSize:17];
    
    return verifyButton;
}

+ (instancetype)createButtonWithFrame:(CGRect)frame
                               target:(id)target
                             selector:(SEL)selector
                                image:(UIImage *)image
                         imagePressed:(UIImage *)imagePres
                                title:(NSString *)title
                           isDarkText:(BOOL)isDark
{
    UIButton  *verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyButton.frame = frame;
    
    if (selector != NULL) {
        
        [verifyButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (isDark) {
        [verifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [verifyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:.0 topCapHeight:0.0];
	[verifyButton setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePres stretchableImageWithLeftCapWidth:.0 topCapHeight:0.0];
	[verifyButton setBackgroundImage:newPressedImage forState:UIControlStateSelected];
    
    [verifyButton setTitle:title forState:UIControlStateNormal];
    
    verifyButton.titleLabel.font = [UIFont systemFontOfSize:18];
    
    verifyButton.backgroundColor = [UIColor clearColor];
    
    return verifyButton;
}


@end
