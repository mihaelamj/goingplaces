//
//  PlaceImagesDataSource.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

//model
#import "Place.h"

@interface PlaceImagesDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithPlace:(Place *)place;

@end
