//
//  NetworkUtil.m
//  Play86
//
//  Created by FNT on 1/28/13.
//  Copyright (c) 2013 Play86. All rights reserved.
//

#import "NetworkUtil.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#import <netinet/in.h>
#import "Reachability.h"
@implementation NetworkUtil


+(BOOL)isNetwork{
//    // Create zero addy
//    struct sockaddr_in zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sin_len = sizeof(zeroAddress);
//    zeroAddress.sin_family = AF_INET;
//    
//    // Recover reachability flags
//    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    
//    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    
//    if (!didRetrieveFlags)
//    {
//        return NO;
//    }
//    
//    BOOL isReachable = flags & kSCNetworkFlagsReachable;
//    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
//    return (isReachable && !needsConnection) ? YES : NO;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    if ([r currentReachabilityStatus] == NotReachable) {
        return NO;
    }else if ([r currentReachabilityStatus] == ReachableViaWWAN){
        return YES;
    }else if ([r currentReachabilityStatus] == ReachableViaWiFi){
        return YES;
    }else{
        return NO;
    }
}


+(BOOL)isWifi{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            return NO;
            //   NSLog(@"没有网络");
            break;
        case ReachableViaWWAN:
            return NO;
            //   NSLog(@"正在使用3G网络");
            break;
        case ReachableViaWiFi:
            return YES;
            //  NSLog(@"正在使用wifi网络");
            break;
    }
    return NO;
}

@end
