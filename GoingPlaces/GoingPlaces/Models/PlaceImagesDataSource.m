//
//  PlaceImagesDataSource.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceImagesDataSource.h"

//table view cell
#import "PlaceImageTableViewCell.h"

@interface PlaceImagesDataSource ()

@property (nonatomic, strong) Place *place;

@end

@implementation PlaceImagesDataSource

#pragma mark -
#pragma mark Init

- (instancetype)initWithPlace:(Place *)place
{
    self = [super init];
    if (self) {
        _place = place;
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (PlaceImage *)placeImageForIndexPath:(NSIndexPath *)indexPath
{
    PlaceImage *placeImage;
    
    if ([self.place.images count] && [self.place.images count] > indexPath.row) {
        placeImage = [self.place.images objectAtIndex:indexPath.row];
    }
    
    return placeImage;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.place.images.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //get cell
    PlaceImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PlaceImageTableViewCell reusableIdentifier]];
    
    //fetch place image
    PlaceImage *placeImage = [self placeImageForIndexPath:indexPath];
    
    //customize cell
    [cell customize:placeImage];
    
    //return cell
    return cell;
}

@end
