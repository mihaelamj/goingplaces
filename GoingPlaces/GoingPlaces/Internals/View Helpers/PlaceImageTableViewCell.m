//
//  PlaceImageTableViewCell.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceImageTableViewCell.h"

#import "UILabel+Style.h"
#import "UIButton+Style.h"

#import "Styles.h"

#import <Masonry/Masonry.h>

#define kTopBottomOffset 3
#define kLeftRightOffset 5
#define kControlsOffset 3
#define kMinButtonWidth 50
#define kMinLabelWidth 45

static NSString * const kPlaceCellIdentifier = @"PlaceTableViewCellIdentifier";

@interface PlaceImageTableViewCell ()

@property (nonatomic, strong) UIImageView *thumbView;

@end

@implementation PlaceImageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //customize
        self.contentView.backgroundColor = kLightGrayColor;
        
        //add subviews
        [self.contentView addSubview:self.thumbView];
        [self.contentView addSubview:self.imageNameLabel];
        [self.contentView addSubview:self.sendImageButton];
        
        //constraints
        [self setSubviewConstraints];
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods - Layout

- (void)setSubviewConstraints
{
    //thumb on the left
    [self.thumbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(kLeftRightOffset);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(@(kThumbImageWidthHeight));
        make.width.equalTo(@(kThumbImageWidthHeight));
    }];
    
    //button on the right
    [self.sendImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-kLeftRightOffset);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.greaterThanOrEqualTo(@(kMinButtonWidth));
    }];
    
    //image name label in the center
    [self.imageNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbView.mas_right).with.offset(kControlsOffset);
        make.right.equalTo(self.sendImageButton.mas_right).with.offset(-kControlsOffset);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.greaterThanOrEqualTo(@(kMinLabelWidth));
    }];
}

#pragma mark -
#pragma mark Public Methods

+ (NSInteger)suggestedHeight
{
    return kThumbImageWidthHeight + 10;
}

+ (NSString *)reusableIdentifier
{
    return kPlaceCellIdentifier;
}

- (void)customize:(PlaceImage *)placeImage
{
    if (placeImage.thumbImage) {
        self.imageView.image = placeImage.thumbImage;
    }
    
    if (placeImage.imageName) {
        self.imageNameLabel.text = placeImage.imageName;
    }
}

#pragma mark -
#pragma mark Private Properties - Views

- (UIImageView *)thumbView
{
    if (!_thumbView) {
        _thumbView = [[UIImageView alloc] init];
    }
    return _thumbView;
}

#pragma mark -
#pragma mark Public Properties - Views

- (UILabel *)imageNameLabel
{
    if (!_imageNameLabel) {
        _imageNameLabel = [UILabel labelWithStyle:LabelStyleImageName];
    }
    return _imageNameLabel;
}

- (UIButton *)sendImageButton
{
    if (!_sendImageButton) {
        _sendImageButton = [UIButton buttonWithStyle:ButtonStyleSendPicture];
        [_sendImageButton setTitle:@"Send" forState:UIControlStateNormal];
    }
    return _sendImageButton;
}

@end
