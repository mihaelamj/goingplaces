//
//  GPMapAnnotation.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

//model
#import "Place.h"

@interface GPMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, strong) Place *place;

- (instancetype)initWithPlace:(Place *)place;

+ (NSString *)annotiationIdentifier;

@end
