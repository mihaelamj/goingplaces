//
//  PlaceImageTableViewCell.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

//model
#import "PlaceImage.h"

@interface PlaceImageTableViewCell : UITableViewCell

+ (NSString *)reusableIdentifier;

- (void)customize:(PlaceImage *)placeImage;

+ (NSInteger)suggestedHeight;

@property (nonatomic, strong) UILabel *imageNameLabel;

@property (nonatomic, strong) UIButton *sendImageButton;

@end
