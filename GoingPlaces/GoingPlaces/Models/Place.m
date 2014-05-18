//
//  GPPlace.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "Place.h"

@implementation Place

+ (instancetype)googlePlaceWithResponseDictionary:(NSDictionary *)responseDictionary
{
    Place *googlePlace = [[Place alloc] init];
    [googlePlace setValuesForKeysWithDictionary:responseDictionary];
    return googlePlace;
}

#pragma mark -
#pragma mark Framework Overrides

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
        self.identifier = value;
    else if ([key isEqualToString:@"name"])
        self.name = value;
    else if ([key isEqualToString:@"geometry"]) {
        NSDictionary *geometryDict = value;
        [self handleGeometryDictionary:geometryDict];
    }
    else if ([key isEqualToString:@"vicinity"])
        self.address = value;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"name = %@, geometry(lat=%@, long=%@), address=%@)", self.name, self.longitude, self.latitude, self.address];
}

#pragma mark -
#pragma mark Private Methods

- (void)handleGeometryDictionary:(NSDictionary *)geometryDictionary
{
    self.latitude = [geometryDictionary valueForKeyPath:@"location.lat"];
    self.longitude = [geometryDictionary valueForKeyPath:@"location.lng"];
}

#pragma mark -
#pragma mark Public Methods

+ (NSArray *)googlePlacesWithResponseArray:(NSArray *)responseArray
{
    NSMutableArray *googlePlacesArray = [NSMutableArray array];
     for (NSDictionary *googlePlaceDictionary in responseArray) {
         
         //create object
         Place *googlePlace = [Place googlePlaceWithResponseDictionary:googlePlaceDictionary];
         
         //add it to result array
         [googlePlacesArray addObject:googlePlace];
         
     }
    
    //return unmutable collection
    return [NSArray arrayWithArray:googlePlacesArray];
}

#pragma mark -
#pragma mark Public Properties

- (NSMutableArray *)images
{
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

@end
