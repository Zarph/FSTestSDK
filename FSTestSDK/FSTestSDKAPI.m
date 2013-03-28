//
//  FSTestSDKAPI.m
//  FSTestSDK
//
//  Created by Marco S. Graciano on 3/28/13.
//  Copyright (c) 2013 MSG. All rights reserved.
//

#import "FSTestSDKAPI.h"

static NSString * const kOAuth2BaseURLString = @"";
static NSString * const kServerAPIURL = @"";
static NSString * const kClientIDString = @"";
static NSString * const kClientSecretString = @"";


@implementation FSTestSDKAPI

+ (FSTestSDKAPI *)sharedClient {
    static FSTestSDKAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kOAuth2BaseURLString];
        _sharedClient = [FSTestSDKAPI clientWithBaseURL:url clientID:kClientIDString secret:kClientSecretString];
        
    });
    
    return _sharedClient;
}



@end
