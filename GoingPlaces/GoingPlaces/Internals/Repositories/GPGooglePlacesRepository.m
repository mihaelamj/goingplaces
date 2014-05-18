//
//  GPGooglePlacesRepository.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPGooglePlacesRepository.h"

//HTTP client
#import "GPGooglePlacesHTTPClient.h"

//model
#import "GooglePlace.h"

@implementation GPGooglePlacesRepository

+ (void)googlePlacesWithCoordinate:(CLLocationCoordinate2D)coordinate distanceInMeters:(NSInteger)distanceInMeters returnBlock:(void (^)(NSArray *googlePlacesArray, NSError *error))returnBlock
{
    [[GPGooglePlacesHTTPClient client] googlePlacesWithLongitude:coordinate.longitude latitude:coordinate.latitude distanceInMeters:distanceInMeters withReturnBlock:^(NSArray *responseArray, NSError *error) {
        
        if (error) {
            
            returnBlock(nil, error);
            
        } else {
            
            //make GooglePlace objects from returned array
            NSArray *googlePlaces = [GooglePlace googlePlacesWithResponseArray:responseArray];
            returnBlock(googlePlaces, nil);
            
        }
    }];
}

@end
