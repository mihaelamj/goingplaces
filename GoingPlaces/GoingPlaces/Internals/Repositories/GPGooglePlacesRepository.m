//
//  GPGooglePlacesRepository.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPGooglePlacesRepository.h"

//HTTP client
#import "GPPlacesHTTPClient.h"

//model
#import "Place+GooglePlaces.h"

@interface GPGooglePlacesRepository ()

@end

@implementation GPGooglePlacesRepository

+ (void)googlePlacesWithCoordinate:(CLLocationCoordinate2D)coordinate distanceInMeters:(NSInteger)distanceInMeters returnBlock:(void (^)(NSArray *googlePlacesArray, NSError *error))returnBlock
{
    //create singelton http client
    GPPlacesHTTPClient *httpClient = [GPPlacesHTTPClient client];
    
    [httpClient googlePlacesWithLongitude:coordinate.longitude latitude:coordinate.latitude distanceInMeters:distanceInMeters withReturnBlock:^(NSArray *responseArray, NSError *error) {
        
        if (error) {
            returnBlock(nil, error);
            
        } else {
            //make GooglePlace objects from returned array
            NSArray *googlePlaces = [Place googlePlacesWithResponseArray:responseArray];
            
            //return block with results
            returnBlock(googlePlaces, nil);
        }
    }];
}

@end
