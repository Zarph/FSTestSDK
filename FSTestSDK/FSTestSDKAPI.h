//
//  FSTestSDKAPI.h
//  FSTestSDK
//
//  Created by Marco S. Graciano on 3/28/13.
//  Copyright (c) 2013 MSG. All rights reserved.
//

#import "AFOAuth2Client.h"

@interface FSTestSDKAPI : AFOAuth2Client

+ (FSTestSDKAPI *)sharedClient;

@end
