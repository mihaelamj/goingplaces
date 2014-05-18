//
//  UIButton+Style.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "UIButton+Style.h"

#import "Styles.h"

@implementation UIButton (Style)

#pragma mark -
#pragma mark Public methods

+ (UIButton *)buttonWithStyle:(ButtonStyle)style;
{
    UIButton *button = [self buttonForStyle:style];
    return button;
}

#pragma mark -
#pragma mark Private methods

+ (UIButton *)buttonForStyle:(ButtonStyle)style
{
    //create button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //style button
    button.backgroundColor = [self backgroundColorForStyle:style];
    button.titleLabel.font = [self fontForStyle:style];
    button.titleLabel.textColor = [self textColorForStyle:style];
    
    //return styled button
    return button;
}

+ (UIFont *)fontForStyle:(ButtonStyle)style
{
    switch (style) {
        case ButtonStyleStart:
            return kBigBoldFont;
        case ButtonStyleOk:
            return kNormalRegularFont;
        case ButtonStyleSendPicture:
            return kNormalRegularFont;
        default:
            return kNormalRegularFont;
    }
    return nil;
}

+ (UIColor *)textColorForStyle:(ButtonStyle)style
{
    switch (style) {
        case ButtonStyleStart:
            return kDarkGrayColor;
        case ButtonStyleOk:
            return [UIColor whiteColor];
        case ButtonStyleSendPicture:
            return [UIColor whiteColor];
        default:
            return [UIColor whiteColor];
    }
    return nil;
}

+ (UIColor *)backgroundColorForStyle:(ButtonStyle)style
{
    switch (style) {
        case ButtonStyleStart:
            return kMarineBlueColor;
        case ButtonStyleOk:
            return kMarineBlueColor;
        case ButtonStyleSendPicture:
            return kMarineBlueColor;
        default:
            return kMarineBlueColor;
    }
    return nil;
}

@end
