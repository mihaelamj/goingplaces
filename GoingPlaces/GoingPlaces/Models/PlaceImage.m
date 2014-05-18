//
//  PlaceImage.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceImage.h"

@implementation PlaceImage

- (instancetype)initWithImageName:(NSString *)imageName imageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _imageUrl = imageUrl;
    }
    return self;
}

@end
