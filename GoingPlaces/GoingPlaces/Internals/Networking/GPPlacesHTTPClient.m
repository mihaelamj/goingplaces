//
//  GPPlacesHTTPClient.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 17/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GPPlacesHTTPClient.h"

#import "Keys.h"

NSString * const kGooglePlacesAPIBaseURL = @"https://maps.googleapis.com/maps/api/place/";
NSString * const kGooglePlacesRequestNearby = @"nearbysearch";

@interface GPPlacesHTTPClient ()

@property (nonatomic, strong) NSString *apiKey;

@end

@implementation GPPlacesHTTPClient

#pragma mark -
#pragma mark Singleton

+ (instancetype)client
{
    static GPPlacesHTTPClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[self alloc] initWithBaseURL:[NSURL URLWithString:kGooglePlacesAPIBaseURL]];
    });
    return client;
}

#pragma mark -
#pragma mark Initializer

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        //set request serilizer
        self.requestSerializer = [AFHTTPRequestSerializer serializer];;
        
        //set response serilizer
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    return self;
}

#pragma mark -
#pragma mark Public fetch Methods

- (void)googlePlacesWithLongitude:(CGFloat)longitude latitude:(CGFloat)latitude distanceInMeters:(NSInteger)distanceInMeters withReturnBlock:(void (^)(NSArray *responseArray, NSError *error))returnBlock
{
    //@INFO: relplace key
    _apiKey = GOOGLE_API_KEY;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //set API key and sesnor
    params[@"key"] = self.apiKey;
    params[@"sensor"] = @"true";
    
    //set required parameters
    params[@"location"] = [NSString stringWithFormat:@"%.7f,%.7f", latitude, longitude];
    params[@"radius"] = [NSString stringWithFormat:@"%ld", (unsigned long)distanceInMeters];
    
    //create relative request path for nearby search, base URL is already configured in AFNetworking HTTP manager
    NSString *requestPath = [NSString stringWithFormat:@"%@/json", kGooglePlacesRequestNearby];
    
    //perform request
    [self GET:requestPath parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseDictionary) {
        
         //fetch results array
        NSArray *responseArrayResult;
        id results =  [responseDictionary objectForKey:@"results"];
        
        //check if results is array
        if ([results isKindOfClass:[NSArray class]])
            responseArrayResult = (NSArray *)results;

        if (returnBlock)
            returnBlock(responseArrayResult, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        FWLog(@"error: %@", error);
        if (returnBlock)
            returnBlock(nil, error);
        
    }];
}


@end
