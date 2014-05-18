//
//  GPAppDelegate.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPAppDelegate.h"

//@TEST:
#import "GooglePlacesViewControllerOld.h"

//first view controller
#import "StartViewController.h"

@interface GPAppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation GPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //@TEST:
//    self.window.rootViewController = [[GooglePlacesViewController alloc] init];
    
    //set navigation controller as root view controller
    self.window.rootViewController = self.navigationController;
    
    //start app
    [self.window makeKeyAndVisible];
    return YES;
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
