//
//  GPAppDelegate.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPAppDelegate.h"

//@TEST:
#import "GooglePlacesViewController.h"

@implementation GPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //@TEST:
    self.window.rootViewController = [[GooglePlacesViewController alloc] init];
    
    //start app
    [self.window makeKeyAndVisible];
    return YES;
}


@end
