//
//  FSTestSDKAPI.m
//  FSTestSDK
//
//  Created by Marco S. Graciano on 3/28/13.
//  Copyright (c) 2013 MSG. All rights reserved.
//

#import "FSTestSDKAPI.h"

static NSString * const kOAuth2BaseURLString = @"https://foursquare.com/";
static NSString * const kServerAPIURL = @"";
static NSString * const kClientIDString = @"AD1QBEWHCZWATQNPFJOET2RD3LOZOXVHAX534NX30UOBNX12";
static NSString * const kClientSecretString = @"IRH3TEV00N1ID1ZHWH0EWNRVVGNOZF2M5V55MYYNW1ZGAS44";


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

-(void)authenticate {
    
    [self authenticateUsingOAuthWithPath:@"oauth2/authenticate" scope:nil redirectURI:@"fsqad1qbewhczwatqnpfjoet2rd3lozoxvhax534nx30uobnx12://authorize" success:^(AFOAuthCredential *credential) {
        
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                                 scope:(NSString *)scope
                           redirectURI:(NSString *)uri
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    // [mutableParameters setObject:kAFOAuthClientCredentialsGrantType forKey:@"grant_type"];
    //[mutableParameters setValue:scope forKey:@"scope"];
    [mutableParameters setValue:uri forKey:@"redirect_uri"];
    [mutableParameters setValue:@"token" forKey:@"response_type"];
    //[mutableParameters setValue:@"authorization_code" forKey:@"grant_type"];
    //[mutableParameters setValue:kClientSecretString forKey:@"client_secret"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self authenticateUsingOAuthWithPath:path parameters:parameters success:success failure:failure];
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                            parameters:(NSDictionary *)parameters
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [mutableParameters setObject:self.clientID forKey:@"client_id"];
    //[mutableParameters setObject:self.secret forKey:@"client_secret"];
    parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self clearAuthorizationHeader];
    
    NSMutableURLRequest *mutableRequest = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    BOOL didOpenOtherApp = NO;
    
    NSLog(@"MutableWeb :%@", mutableRequest.URL);
    
    didOpenOtherApp = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[mutableRequest.URL absoluteString]]];
    
}


- (BOOL)handleOpenURL:(NSURL *)url{
    
    NSString *query = [url fragment];
    if (!query) {
        query = [url query];
    }
    NSLog(@"URL FRAGMENT: %@", [url fragment]);
    
    self.params = [self parseURLParams:query];
    NSString *accessToken = [self.params valueForKey:@"access_token"];
    
    
    // If the URL doesn't contain the access token, an error has occurred.
    if (!accessToken) {
        //NSString *error = [self.params valueForKey:@"error"];
        
        NSString *errorReason = [self.params valueForKey:@"error_reason"];
        
        //   BOOL userDidCancel = [errorReason isEqualToString:@"user_denied"];
        //     [self igDidNotLogin:userDidCancel];
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:errorReason
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        return YES;
    }
    
    NSString *refreshToken = [self.params  valueForKey:@"refresh_token"];
    // refreshToken = refreshToken ? refreshToken : [parameters valueForKey:@"refresh_token"];
    
    self.credential = [AFOAuthCredential credentialWithOAuthToken:[self.params valueForKey:@"access_token"] tokenType:[self.params  valueForKey:@"token_type"]];
    [self.credential setRefreshToken:refreshToken expiration:[NSDate dateWithTimeIntervalSinceNow:[[self.params  valueForKey:@"expires_in"] integerValue]]];
    
    [AFOAuthCredential storeCredential:self.credential withIdentifier:self.serviceProviderIdentifier];
    
    [self setAuthorizationHeaderWithCredential:self.credential];
    
    NSLog(@"ACCESS TOKEN: %@", self.credential.accessToken);
    
    //Store the accessToken on userDefaults
    [[NSUserDefaults standardUserDefaults] setObject:self.credential.accessToken forKey:@"accessToken"];
	[[NSUserDefaults standardUserDefaults] synchronize];
    
    [_loginDelegate performLoginFromHandle];
    
    //     [self igDidLogin:accessToken/* expirationDate:expirationDate*/];
    return YES;
    
}

- (NSDictionary*)parseURLParams:(NSString *)query {
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString *pair in pairs) {
		NSArray *kv = [pair componentsSeparatedByString:@"="];
		NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
		[params setObject:val forKey:[kv objectAtIndex:0]];
	}
    return params;
}


@end
