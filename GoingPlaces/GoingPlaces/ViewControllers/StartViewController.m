//
//  StartViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "StartViewController.h"

//main view
#import "StartView.h"

//@TEST:
//#import "GooglePlacesViewControllerOld.h"

//GooglePlaces VC - detail
#import "GooglePlacesViewController.h"

@interface StartViewController ()

@property (nonatomic, strong) StartView *mainView;

@end

@implementation StartViewController

//maybe remove
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)loadView
{
    //create main view
    self.mainView = [[StartView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.mainView;
    
    //set button title
    [self.mainView.startButton setTitle:@"START" forState:UIControlStateNormal];
    
    //set button action
    [self.mainView.startButton addTarget:self action:@selector(startButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -
#pragma mark View Actions

- (void)startButtonClicked
{
    //push detail VC
    GooglePlacesViewController *googlePlacesViewController = [[GooglePlacesViewController alloc] init];
    
//    GooglePlacesViewControllerOld *googlePlacesViewController = [[GooglePlacesViewControllerOld alloc] init];
    [self.navigationController pushViewController:googlePlacesViewController animated:YES];
}


@end
