//
//  DemoViewController.m
//  FSTestSDK
//
//  Created by Marco S. Graciano on 3/28/13.
//  Copyright (c) 2013 MSG. All rights reserved.
//

#import "DemoViewController.h"
#import "FSTestSDKAPI.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    //[[FSTestSDKAPI sharedClient] getUserDataWithUserId:nil AndWithDelegate:nil];
    //[[FSTestSDKAPI sharedClient] getLeaderboardsWithNeighborsParameter:nil AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getRequestsWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getSearchUserWithName:@"Julian" AndParameters:nil AndWithDelegate:nil];
    //[[FSTestSDKAPI sharedClient] getUserBadgesWithUserId:@"self" AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getUserCheckinsWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getUserFriendsWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];
    //[[FSTestSDKAPI sharedClient] getUserListsWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getUserMayorshipsWithUserId:@"self" AndWithDelegate:nil];
//[[FSTestSDKAPI sharedClient] getUserPhotosWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];
   /// [[FSTestSDKAPI sharedClient] getUserTipsWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] getUserVenueHistoryWithUserId:@"self" AndParameters:nil AndWithDelegate:nil];

   // [[FSTestSDKAPI sharedClient]postApproveWithUserId:@"35800131" AndWithDelegate:nil];
  //[[FSTestSDKAPI sharedClient] postDenyWithUserId:@"49307196" AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] postRequestWithUserId:@"51844666" AndWithDelegate:nil];
   // [[FSTestSDKAPI sharedClient] postSetPingsWithUserId:@"23342898" AndValue:@"True" AndWithDelegate:nil];
   //[[FSTestSDKAPI sharedClient ] postUnfriendWithUserId:@"35800131" AndWithDelegate:nil];
   
    /* NOT WORKING YET _____ UIImage *image = [UIImage imageNamed:@"51112.jpg"];
    
    [[FSTestSDKAPI sharedClient]postUpdateWithPhoto:image AndWithDelegate:nil];*/
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
