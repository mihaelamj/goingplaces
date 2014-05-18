//
//  GPGooglePlacesRepository.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

/**
 *  Repository class for fetching Place objects from Google nearby places API
 */
@interface GPGooglePlacesRepository : NSObject

/**
 *  Class method for fetching array of Place objects, from Google Places (nearby) API
 *
 *  @param coordinate       center coordinate
 *  @param distanceInMeters radius
 *  @param returnBlock      block returning array of Place objects and/or error
 */
+ (void)googlePlacesWithCoordinate:(CLLocationCoordinate2D)coordinate distanceInMeters:(NSInteger)distanceInMeters returnBlock:(void (^)(NSArray *googlePlacesArray, NSError *error))returnBlock;

@end
