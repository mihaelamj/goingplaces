//
//  GPAppDelegate.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPAppDelegate.h"

//first view controller
#import "StartViewController.h"

//AFNetworking config
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

@interface GPAppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation GPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //common configuration for entire application
    [self configureApp];
    
    //set navigation controller as root view controller
    self.window.rootViewController = self.navigationController;
    
    //start app
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -
#pragma mark Private Methods

- (void)configureApp
{
    //set activity indicator for all AFNetworking operations (required by Apple)
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    //set status bar style
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark -
#pragma mark Properties

- (UINavigationController *)navigationController
{
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:[[StartViewController alloc] init]];
    }
    
    return _navigationController;
}


@end
