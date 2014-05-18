//
//  GPGooglePlacesHTTPClient.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface GPGooglePlacesHTTPClient : AFHTTPSessionManager

+ (instancetype)client;

- (void)googlePlacesWithLongitude:(CGFloat)longitude latitude:(CGFloat)latitude distanceInMeters:(NSInteger)distanceInMeters withReturnBlock:(void (^)(NSArray *responseArray, NSError *error))returnBlock;

@end
