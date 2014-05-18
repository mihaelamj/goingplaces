//
//  GPPlace.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "GooglePlace.h"

@implementation GooglePlace

+ (instancetype)googlePlaceWithResponseDictionary:(NSDictionary *)responseDictionary
{
    GooglePlace *googlePlace = [[GooglePlace alloc] init];
    [googlePlace setValuesForKeysWithDictionary:responseDictionary];
    return googlePlace;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
        self.identifier = value;
    else if ([key isEqualToString:@"name"])
        self.name = value;
    else if ([key isEqualToString:@"location.lat"])
        self.latitude = @([value doubleValue]);
    else if ([key isEqualToString:@"location.lng"])
        self.longitude = @([value doubleValue]);
    else if ([key isEqualToString:@"vicinity"])
        self.address = value;
}

@end
