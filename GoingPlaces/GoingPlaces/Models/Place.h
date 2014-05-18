//
//  Place.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

//model
#import "PlaceImage.h"

@interface Place : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;

//images are added by user, and not with repository method
@property (nonatomic, strong) NSArray *images; //of PlaceImage

/**
 *  Makes array of Place objects from Google Plases API response
 *
 *  @param responseArray Google Plases API response
 *
 *  @return array of Place objects
 */
+ (NSArray *)googlePlacesWithResponseArray:(NSArray *)responseArray;

@end
