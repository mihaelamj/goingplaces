//
//  GooglePlacesViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GooglePlacesViewController.h"

//map view
#import <MapKit/MapKit.h>

//location manager
#import <CoreLocation/CoreLocation.h>

//@TEST:
#import "GPGooglePlacesHTTPClient.h"

//Google key
#import "Keys.h"

@interface GooglePlacesViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic ,strong) CLLocation *currentLocation;

@property (nonatomic) NSInteger distanceInMeters;

@end

@implementation GooglePlacesViewController

- (id)init
{
    self = [super init];
    if (self) {
        
        //set initial distance
        _distanceInMeters = 1000;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //add map view
    [self.view addSubview:self.mapView];
    
    //start locating
    [self.locationManager startUpdatingLocation];
    
    //@TEST:
//    self.distanceInMeters = 500;
}

#pragma mark -
#pragma mark Private Methods

- (void)centerMap:(CLLocation *)location distanceMeters:(NSInteger)distanceMeters
{
    //check if we have item )
    if (self.currentLocation) {
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, distanceMeters, distanceMeters);
        
        //set region on map
        [self.mapView setRegion:region animated:YES];
    }
}

- (void)updateLocationWithDistance
{
    if (self.currentLocation)
        [self centerMap:self.currentLocation distanceMeters:self.distanceInMeters];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //get new location
    CLLocation *newLocation = [locations lastObject];
    
    //set current location (will center map)
    self.currentLocation = newLocation;
        
    //stop locating
    [self.locationManager stopUpdatingLocation];
    
    //@TEST:
    
    [[GPGooglePlacesHTTPClient client] googlePlacesWithLongitude:self.currentLocation.coordinate.longitude latitude:self.currentLocation.coordinate.latitude distanceInMeters:self.distanceInMeters withReturnBlock:^(NSArray *responseArray, NSError *error) {
        
        FWLog(@"got locations: %@", responseArray);
        
    }];
    
    //@TODO: show Google places
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //stop locating
    [self.locationManager stopUpdatingLocation];
    
    //stop locationg
    self.currentLocation = nil;
}

#pragma mark -
#pragma mark Private Properties

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        
        //set self as delegate
        _locationManager.delegate = self;
        
        //set distance and accuracy
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return _locationManager;
}

- (void)setCurrentLocation:(CLLocation *)currentLocation
{
    _currentLocation = currentLocation;
    
    //center map
    [self updateLocationWithDistance];
}

- (void)setDistanceInMeters:(NSInteger)distanceInMeters
{
    _distanceInMeters = distanceInMeters;
    //center map
    [self updateLocationWithDistance];
}

#pragma mark -
#pragma mark Private Properties - Views

- (MKMapView *)mapView
{
    if (!_mapView) {
        
        //take whole view space
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        //set self as delegate
        _mapView.delegate = self;
        
        //always show users location
        _mapView.showsUserLocation = YES;
    }
    
    return _mapView;
}


@end
