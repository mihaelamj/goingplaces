//
//  GooglePlacesViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GooglePlacesViewController.h"

//main view
#import "GooglePlacesView.h"

//location manager
#import <CoreLocation/CoreLocation.h>

//GooglePlaces (fetch) repositry
#import "GPGooglePlacesRepository.h"

@interface GooglePlacesViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) GooglePlacesView *mainView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation GooglePlacesViewController

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
    self.mainView = [[GooglePlacesView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.mainView;
    
    //set self as map delegate
    self.mainView.mapView.delegate = self;
    
    //set self as location manager delegate
    self.locationManager.delegate = self;
    
    //start locating
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //get new location
    CLLocation *newLocation = [locations lastObject];
    
    //set current location (will center map)
    self.mainView.currentLocation = newLocation;
    FWLog(@"got location: %@", newLocation);
    
    //stop locating
    [self.locationManager stopUpdatingLocation];
    
    //fetch Google Places
    [GPGooglePlacesRepository googlePlacesWithCoordinate:self.mainView.currentLocation.coordinate distanceInMeters:self.mainView.distanceInMeters returnBlock:^(NSArray *googlePlacesArray, NSError *error) {
        
        FWLog(@"got Google Places: %@", googlePlacesArray);
        
        //@TODO: show Google places
    }];
}

#pragma mark -
#pragma mark Private Properties

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        
        //set distance and accuracy
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return _locationManager;
}


@end
