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

@protocol FoursquareDelegate <NSObject>



@end

@interface FSTestSDKAPI : AFOAuth2Client

@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, strong) NSObject <HandleURLLoginDelegate> *loginDelegate;

+ (FSTestSDKAPI *)sharedClient;
-(void)authenticate;
- (BOOL)handleOpenURL:(NSURL *)url;

-(void)getUserDataWithUserId:(NSString *)userID AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getLeaderboardsWithNeighborsParameter:(NSString *)neighbors AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getRequestsWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getSearchUserWithName:(NSString *)name AndParameters:(NSDictionary *)searchParams AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserBadgesWithUserId:(NSString *)userID AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserCheckinsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)checkinsParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserFriendsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)friendsParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserListsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)listsParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserMayorshipsWithUserId:(NSString *)userID AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserPhotosWithUserId:(NSString *)userID AndParameters:(NSDictionary *)friendsParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserTipsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)tipsParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)getUserVenueHistoryWithUserId:(NSString *)userID AndParameters:(NSDictionary *)vHistoryParam AndWithDelegate:(NSObject <FoursquareDelegate> *)delegate;
-(void)postApproveWithUserId:(NSString *)userID AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;
-(void)postDenyWithUserId:(NSString *)userID AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;
-(void)postRequestWithUserId:(NSString *)userID AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;
-(void)postSetPingsWithUserId:(NSString *)userID AndValue:(NSString *)value AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;
-(void)postUnfriendWithUserId:(NSString *)userID AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;
-(void)postUpdateWithPhoto:(UIImage *)photo AndWithDelegate:(NSObject<FoursquareDelegate> *)delegate;






@end
