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
	
    [[FSTestSDKAPI sharedClient] getUserDataWithUserId:@"self" AndWithDelegate:nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
