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

//Places VC - detail
#import "PlacesOnMapViewController.h"

@interface StartViewController ()

@property (nonatomic, strong) StartView *mainView;

@end

@implementation StartViewController

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
    PlacesOnMapViewController *placesViewController = [[PlacesOnMapViewController alloc] init];
    [self.navigationController pushViewController:placesViewController animated:YES];
}


@end
