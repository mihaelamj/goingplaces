//
//  GPPlace.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "Place.h"

@implementation Place

#pragma mark -
#pragma mark Framework Overrides

- (NSString *) description
{
    return [NSString stringWithFormat:@"name = %@, geometry(lat=%@, long=%@), address=%@)", self.name, self.longitude, self.latitude, self.address];
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
