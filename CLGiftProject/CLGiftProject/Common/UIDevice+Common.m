//
//  UIDevice+Common.m
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import "UIDevice+Common.h"

@implementation UIDevice (Common)

CGRect AppBounds()
{
    return [UIScreen mainScreen].bounds;
}

CGRect AppFrame()
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height);
}

- (BOOL)isPad{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

- (BOOL)isPhone5{
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
}

#pragma mark- 是否越狱
static const char* jailbreak_apps[] =
{
    "/Applications/Cydia.app",
    "/Applications/blackra1n.app",
    "/Applications/blacksn0w.app",
    "/Applications/greenpois0n.app",
    "/Applications/limera1n.app",
    "/Applications/redsn0w.app",
    NULL,
};

+ (BOOL)hasJailBreak
{
    // Check whether the jailbreak apps are installed
    for (int i = 0; jailbreak_apps[i] != NULL; ++i)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_apps[i]]])
        {
            return YES;
        }
    }
    
    return NO;
}
@end
