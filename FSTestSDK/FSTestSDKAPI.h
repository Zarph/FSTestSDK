//
//  FSTestSDKAPI.h
//  FSTestSDK
//
//  Created by Marco S. Graciano on 3/28/13.
//  Copyright (c) 2013 MSG. All rights reserved.
//

#import "AFOAuth2Client.h"
@protocol HandleURLLoginDelegate <NSObject>

-(void)performLoginFromHandle;

@end


@interface FSTestSDKAPI : AFOAuth2Client

@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, strong) NSObject <HandleURLLoginDelegate> *loginDelegate;

+ (FSTestSDKAPI *)sharedClient;
-(void)authenticate;
- (BOOL)handleOpenURL:(NSURL *)url;

@end
