//
//  PlacesOnMapView.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

//map view
#import <MapKit/MapKit.h>

@interface PlacesOnMapView : UIView

//views
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UISlider *distanceSlider;

//objects
@property (nonatomic ,strong) CLLocation *currentLocation;
@property (nonatomic) NSInteger distanceInMeters;

@end
