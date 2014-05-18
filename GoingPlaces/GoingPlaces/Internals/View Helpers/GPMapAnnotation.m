//
//  GPMapAnnotation.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPMapAnnotation.h"

@implementation GPMapAnnotation

- (instancetype)initWithPlace:(Place *)place
{
    self = [super init];
    if (self) {
        _place = place;
    }
    return self;
}

+ (NSString *)annotiationIdentifier
{
    return @"GPMapAnnotationID";
}

#pragma mark -
#pragma mark MKAnnotation Protocol - Properties

- (NSString *)title
{
    if (self.place)
        return self.place.name;
    return @"Unknown title";
}

- (NSString *)subtitle
{
    if (self.place)
        return self.place.address;
    return @"Unknown address";
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D placeCoordinate = CLLocationCoordinate2DMake(0, 0);
    if (self.place)
        placeCoordinate = CLLocationCoordinate2DMake([self.place.latitude floatValue], [self.place.longitude floatValue]);
    return placeCoordinate;
}

@end
