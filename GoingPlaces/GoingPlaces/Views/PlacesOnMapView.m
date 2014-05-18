//
//  PlacesOnMapView.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlacesOnMapView.h"

//Auto Layout
#import <Masonry/Masonry.h>

//UI Factory
#import "UILabel+Style.h"

//sizes and offsets
#define kLeftRightOffset 10
#define kTopOffset 5
#define kLabelSliderHeight 35
#define kSmallLabelHeight 10
#define kSlallLabelTopOffset 2

@interface PlacesOnMapView ()

@property (nonatomic, strong) UILabel *distanceInfoLabel;

@end

@implementation PlacesOnMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //add button
        [self addSubview:self.mapView];
        
        //add label
        [self addSubview:self.distanceLabel];
        
        //add slider
        [self addSubview:self.distanceSlider];
        
        //add small distance label
        [self addSubview:self.distanceInfoLabel];
        
        //set initial distance and update label
        _distanceInMeters = 1000;
        [self updateDistanceInfoLabel:_distanceInMeters];
        
        //constraints
        [self setSubviewConstraints];
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods - Layout

- (void)setSubviewConstraints
{
    //label on top left, with offset
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.top.equalTo(self.mas_top).with.offset(kTopOffset);
        make.height.greaterThanOrEqualTo(@(kLabelSliderHeight));
    }];
    
    //slider on top, right to the label, with offset
    [self.distanceSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.distanceLabel.mas_right).with.offset(kLeftRightOffset);
        make.top.equalTo(self.distanceLabel.mas_top);
        make.right.equalTo(self.mas_right).with.offset(-kLeftRightOffset);
        make.height.greaterThanOrEqualTo(@(kLabelSliderHeight));
    }];
    
    //map view, below label and slider, with offset
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.distanceLabel.mas_bottom).with.offset(kTopOffset);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    //distance info label, above map, on the left
    [self.distanceInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mapView.mas_top).with.offset(-kSlallLabelTopOffset);
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.height.greaterThanOrEqualTo(@(kSmallLabelHeight));
    }];
}

#pragma mark -
#pragma mark Private Methods

- (void)centerMap:(CLLocation *)location distanceMeters:(NSInteger)distanceMeters
{
    //check if we have item 
    if (self.currentLocation) {
        //make region, 2x distance
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, distanceMeters*2, distanceMeters*2);
        //set region on map
        [self.mapView setRegion:region animated:YES];
    }
}

- (void)updateLocationWithDistance
{
    if (self.currentLocation)
        [self centerMap:self.currentLocation distanceMeters:self.distanceInMeters];
}

- (void)updateDistanceInfoLabel:(NSInteger)distance
{
    self.distanceInfoLabel.text = [NSString stringWithFormat:@"%dm", distance];
}

#pragma mark -
#pragma mark Public Properties - Views

- (MKMapView *)mapView
{
    if (!_mapView) {
        
        _mapView = [[MKMapView alloc] init];
        
        //always show user location
        _mapView.showsUserLocation = YES;
        
        //prepare for Auto Layout
        _mapView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _mapView;
}

- (UILabel *)distanceLabel
{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel labelWithStyle:LabelStyleDistance];
        
        //prepare for Auto Layout
        _distanceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _distanceLabel;
}

- (UISlider *)distanceSlider
{
    if (!_distanceSlider) {
        _distanceSlider = [[UISlider alloc] init];
        
        //prepare for Auto Layout
        _distanceSlider.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _distanceSlider;
}

#pragma mark -
#pragma mark Private Properties - Views

- (UILabel *)distanceInfoLabel
{
    if (!_distanceInfoLabel) {
        _distanceInfoLabel = [UILabel labelWithStyle:LabelStyleSmallDistance];

        //prepare for Auto Layout
        _distanceInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _distanceInfoLabel;
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
    
    //update info label text
    [self updateDistanceInfoLabel:_distanceInMeters];
    
    //center map
    [self updateLocationWithDistance];
}

@end
