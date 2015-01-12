//
//  CLPublic.m
//  CLGiftProject
//
//  Created by chenglei on 15/1/12.
//  Copyright (c) 2015年 CLCompany. All rights reserved.
//

#import "CLPublic.h"

@implementation CLPublic




+(UIColor *) getColor: (NSString *) hexColor
{
    unsigned int ired, igreen, iblue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&ired];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&igreen];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&iblue];
    
    return [UIColor colorWithRed:(float)(ired/255.0f) green:(float)(igreen/255.0f) blue:(float)(iblue/255.0f) alpha:1.0f];
}


@end
