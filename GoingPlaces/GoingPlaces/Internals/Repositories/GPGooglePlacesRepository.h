//
//  GPGooglePlacesRepository.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@interface GPGooglePlacesRepository : NSObject

+ (void)googlePlacesWithCoordinate:(CLLocationCoordinate2D)coordinate distanceInMeters:(NSInteger)distanceInMeters returnBlock:(void (^)(NSArray *googlePlacesArray, NSError *error))returnBlock;

@end
