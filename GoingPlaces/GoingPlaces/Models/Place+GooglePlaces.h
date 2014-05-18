//
//  Place+GooglePlaces.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 19/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "Place.h"

/**
 *  Category on Place object to create it from Google Places dictionary
 */

@interface Place (GooglePlaces)

/**
 *  Makes array of Place objects from Google Plases API response
 *
 *  @param responseArray Google Plases API response
 *
 *  @return array of Place objects
 */
+ (NSArray *)googlePlacesWithResponseArray:(NSArray *)responseArray;

@end
