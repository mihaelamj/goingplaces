//
//  GooglePlacesView.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GooglePlacesView.h"

//Auto Layout
#import <Masonry/Masonry.h>

//sizes
#define kMapTopOffset 70
#define kLeftRightOffset 10

@implementation GooglePlacesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //set initial distance
        _distanceInMeters = 1000;

        //add button
        [self addSubview:self.mapView];
        
        //constraints
        [self setSubviewConstraints];
        
        FWLog(@"mapView contrs: %@", self.mapView.constraints);
        
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods - Layout

- (void)setSubviewConstraints
{
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top).with.offset(kMapTopOffset);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark -
#pragma mark Private Methods

- (void)centerMap:(CLLocation *)location distanceMeters:(NSInteger)distanceMeters
{
    //check if we have item 
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
#pragma mark Public Properties - Views

- (MKMapView *)mapView
{
    if (!_mapView) {
        
        //take whole view space
        _mapView = [[MKMapView alloc] init];
        
        //always show users location
        _mapView.showsUserLocation = YES;
        
        _mapView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _mapView;
}

#pragma mark -
#pragma mark Private Properties


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

@end
