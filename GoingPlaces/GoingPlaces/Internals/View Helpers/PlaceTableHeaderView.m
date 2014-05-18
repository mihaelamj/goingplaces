//
//  PlaceTableHeaderView.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceTableHeaderView.h"

//Auto Layout
#import <Masonry/Masonry.h>

#import "Styles.h"

//UI Factory
#import "UILabel+Style.h"
#import "UITextView+Style.h"
#import "UITextField+Style.h"

//sizes and offsets
#define kLeftRightOffset 5
#define kTopOffset 5
#define kNameLabelHeight 15
#define kAddressHeight 35
#define kControlsOffset 2

@implementation PlaceTableHeaderView

#pragma mark -
#pragma mark Public

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //add subviews
        [self addSubview:self.nameTextField];
        [self addSubview:self.addressTextView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.addressLabel];
        
        //constraints
        [self setSubviewConstraints];
    }
    return self;
}

+ (NSInteger)suggestedHeight
{
//    return kTopOffset + kNameLabelHeight + kControlsOffset + kNameLabelHeight + kTopOffset + kNameLabelHeight + kControlsOffset + kAddressHeight + kTopOffset;
    return kTopOffset*3 + kNameLabelHeight*3 + kControlsOffset*2 + kAddressHeight;
}

#pragma mark -
#pragma mark Private Methods - Layout

- (void)setSubviewConstraints
{
    //name label on top left, with left offset
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.top.equalTo(self.mas_top).with.offset(kTopOffset);
        make.height.greaterThanOrEqualTo(@(kNameLabelHeight));
    }];
    
    //name text field below
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.top.equalTo(self.self.nameLabel.mas_bottom).with.offset(kControlsOffset);
        make.height.greaterThanOrEqualTo(@(kNameLabelHeight));
    }];
    
    //addres label below name field
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.top.equalTo(self.self.nameTextField.mas_bottom).with.offset(kTopOffset);
        make.height.greaterThanOrEqualTo(@(kNameLabelHeight));
    }];
    
    //addres text view below address label
    [self.addressTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kLeftRightOffset);
        make.top.equalTo(self.self.addressLabel.mas_bottom).with.offset(kControlsOffset);
        make.height.greaterThanOrEqualTo(@(kAddressHeight));
    }];

}

#pragma mark -
#pragma mark Public Properties - Views

- (UITextField *)nameTextField
{
    if (!_nameTextField) {
        _nameTextField = [UITextField textFieldWithStyle:TextFieldStyleName];
        
        //prepare for Auto Layout
        _nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _nameTextField;
}

- (UITextView *)addressTextView
{
    if (!_addressTextView) {
        _addressTextView = [UITextView textViewWithStyle:TextViewStyleAddress];
        
        //prepare for Auto Layout
        _addressTextView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _addressTextView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithStyle:LabelStyleDescription];
        
        //prepare for Auto Layout
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _nameLabel;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [UILabel labelWithStyle:LabelStyleDescription];
    }
    return _addressLabel;
}

@end
