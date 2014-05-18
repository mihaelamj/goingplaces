//
//  GPBaseViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPBaseViewController.h"

@interface GPBaseViewController ()

@end

@implementation GPBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //move content below navigation bar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //set navigation bar logo
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goingplaces_logo"]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bar"] forBarMetrics:UIBarMetricsDefault];
    
    //remove text from back button
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}
@end
