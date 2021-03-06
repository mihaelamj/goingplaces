//
//  PlacesOnMapViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlacesOnMapViewController.h"

//main view
#import "PlacesOnMapView.h"

//location manager
#import <CoreLocation/CoreLocation.h>

//progress hud
#import <MBProgressHUD.h>

//GooglePlaces (fetch) repositry
#import "GPGooglePlacesRepository.h"

//Annotation view
#import "GPMapAnnotation.h"

//detail VC - edit Place object
#import "PlaceDetailViewController.h"

@interface PlacesOnMapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) PlacesOnMapView *mainView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) NSArray *currentPlaces; //of Place

@end

@implementation PlacesOnMapViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)loadView
{
    //create main view
    self.mainView = [[PlacesOnMapView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.mainView;
    
    //set distance label caption
    self.mainView.distanceLabel.text = @"Distance:";
    
    //set self as map delegate
    self.mainView.mapView.delegate = self;
    
    //set distance slider properties and action
    self.mainView.distanceSlider.minimumValue = 1000;
    self.mainView.distanceSlider.maximumValue = 50000;
    [self.mainView.distanceSlider addTarget:self action:@selector(sliderFinishedChanging:) forControlEvents:UIControlEventTouchUpInside];
    
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
#pragma mark View Actions

- (void)sliderFinishedChanging:(UISlider *)sender
{
    //set new distance
    self.mainView.distanceInMeters = ceil(sender.value);
    
    //new search, so start location manager
    [self.locationManager startUpdatingLocation];
}

#pragma mark -
#pragma mark Private Methods

- (void)drawPlacesOnMap
{
    //delete old annotations
    for (id<MKAnnotation> annotation in self.mainView.mapView.annotations) {
        [self.mainView.mapView removeAnnotation:annotation];
    }
    
    //draw new annotations with fetched places
    for (Place *place in self.currentPlaces) {
        
        //create annotation view
        GPMapAnnotation *mapAnnotation = [[GPMapAnnotation alloc] initWithPlace:place];
        
        //add it to map view
        [self.mainView.mapView addAnnotation:mapAnnotation];
    }
}

- (void)fetchPlaces
{
    //show spinner
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //fetch Google Places
    [GPGooglePlacesRepository googlePlacesWithCoordinate:self.mainView.currentLocation.coordinate distanceInMeters:self.mainView.distanceInMeters returnBlock:^(NSArray *googlePlacesArray, NSError *error) {
        
        //set and show fetched Google places
        self.currentPlaces = googlePlacesArray;
        
        //hide spinner
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //get new location
    CLLocation *newLocation = [locations lastObject];
    
    //set current location (will center map)
    self.mainView.currentLocation = newLocation;
    
    //stop locating
    [self.locationManager stopUpdatingLocation];
    
    //fetch nearby places
    [self fetchPlaces];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *annotationView;
    
    if ([annotation isKindOfClass:[GPMapAnnotation class]]) {
        
        //try to deque annotation
        annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:[GPMapAnnotation annotiationIdentifier]];
        
        //init new annotation if there are no available annotations to deque
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:[GPMapAnnotation annotiationIdentifier]];
            
            //display extra information in a callout bubble
            annotationView.canShowCallout = YES;
            
            //set custom pin image
            annotationView.image = [UIImage imageNamed:@"red_pin_bigger"];
            
            //add accessory button view (i)
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
        } else {
            annotationView.annotation = annotation;
        }
    }
    
    return annotationView;
}

//called when user clicks on (i) button
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    Place *place = [(GPMapAnnotation *)view.annotation place];
    
    //deselct annotation
    [mapView deselectAnnotation:view.annotation animated:NO];
    
    //push detail VC
    PlaceDetailViewController *placeViewController = [[PlaceDetailViewController alloc] initWithPlace:place];
    [self.navigationController pushViewController:placeViewController animated:YES];
    
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

- (void)setCurrentPlaces:(NSArray *)currentPlaces
{
    _currentPlaces = currentPlaces;
    
    //re-draw places on the map
    [self drawPlacesOnMap];
}


@end
