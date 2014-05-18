//
//  GPPlacesHTTPClient.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface GPPlacesHTTPClient : AFHTTPSessionManager

/**
 *  Singleton method
 *
 *  @return GPGooglePlacesHTTPClient instance
 */
+ (instancetype)client;

/**
 *  Method for fetching Google Nearby Places
 *
 *  @param longitude        longitude
 *  @param latitude         latitude
 *  @param distanceInMeters radius of search
 *  @param returnBlock      block with respose array holding Google Places dictionaries amd/or error
 */
- (void)googlePlacesWithLongitude:(CGFloat)longitude latitude:(CGFloat)latitude distanceInMeters:(NSInteger)distanceInMeters withReturnBlock:(void (^)(NSArray *responseArray, NSError *error))returnBlock;

@end
