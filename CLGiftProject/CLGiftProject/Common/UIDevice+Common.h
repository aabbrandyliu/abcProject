//
//  UIDevice+Common.h
//  MOJIDemo
//
//  Created by mac on 14-3-29.
//  Copyright (c) 2014年 com.moji. All rights reserved.
//

#import <UIKit/UIKit.h>

//状态栏高度
#define STATEBAR_HEIGHT 20
//自定义UINavigationBar的高度
#define NAVIGATIONBAR_HEIGHT 44
//自定义UITabBar的高度
#define TABBAR_HEIGHT 49
//TabBar按钮的宽度
#define TABBAR_TAP_BUTTON_WIDTH 64
//设备宽度
#define IPHONE_WIDTH 320
//设备高度
#define IPHONE_HEIGHT 480
//iphone5设备高度
#define IPHONE5_HEIGHT 568
//ipad设备宽度
#define IPAD_WIDTH 768
//ipad设备高度
#define IPAD_HEIGHT 1024

/*

@brief	视图方向

typedef enum {
    SSInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),
    SSInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),
    SSInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),
    SSInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),
    SSInterfaceOrientationMaskLandscape = (SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight),
    SSInterfaceOrientationMaskAll = (SSInterfaceOrientationMaskPortrait | SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight | SSInterfaceOrientationMaskPortraitUpsideDown),
    SSInterfaceOrientationMaskAllButUpsideDown = (SSInterfaceOrientationMaskPortrait | SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight),
}SSInterfaceOrientationMask;
*/

@interface UIDevice (Common)

/**
 *@返回当前应用的整个屏幕大小
 */
CGRect AppBounds();

/**
 *@返回当前应用的边框
 */
CGRect AppFrame();

/**
 *	@brief	判断是否为iPad设备
 *
 *	@return	YES：是，NO：否
 */
- (BOOL)isPad;

/**
 *	@brief	判断是否为iPhone5
 *
 *	@return	YES：是，NO：否
 */
- (BOOL)isPhone5;

/**
 *  判断是否越狱
 *
 *  @return YES:是,NO:否
 */
+ (BOOL)hasJailBreak;

@end
