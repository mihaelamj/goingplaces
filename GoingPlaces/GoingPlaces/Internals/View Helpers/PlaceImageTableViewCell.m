//
//  PlaceImageTableViewCell.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceImageTableViewCell.h"

static NSString * const kPlaceCellIdentifier = @"PlaceTableViewCellIdentifier";

@implementation PlaceImageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark Public methods

+ (NSString *)reusableIdentifier
{
    return kPlaceCellIdentifier;
}

- (void)customize:(PlaceImage *)placeImage
{
    //@TODO: to implement

}

@end
