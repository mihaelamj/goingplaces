//
//  UILabel+Style.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "UILabel+Style.h"

#import "Styles.h"

@implementation UILabel (Style)

#pragma mark -
#pragma mark Public methods

+ (UILabel *)labelWithStyle:(LabelStyle)style
{
    UILabel *label = [self labelForStyle:style];
    return label;
}

#pragma mark -
#pragma mark Private methods

+ (UILabel *)labelForStyle:(LabelStyle)style
{
    //create label
    UILabel *label = [[UILabel alloc] init];
    
    //style label
    label.backgroundColor = [UIColor clearColor];
    label.font = [self fontForStyle:style];
    label.textColor = [self textColorForStyle:style];
    label.textAlignment = [self textAligmentForStyle:style];
    label.numberOfLines = [self numberOfLinesForStyle:style];
    
    //return style label
    return label;
}

+ (NSInteger)numberOfLinesForStyle:(LabelStyle)style
{
    switch (style) {
        case LabelStyleDistance:
            return 1;
        case LabelStyleSmallDistance:
            return 1;
        case LabelStyleDescription:
            return 1;
        case LabelStyleHeader:
            return 1;
        default:
            return 1;
    }
}

+ (NSTextAlignment)textAligmentForStyle:(LabelStyle)style
{
    switch (style) {
        case LabelStyleDistance:
            return NSTextAlignmentLeft;
        case LabelStyleSmallDistance:
            return NSTextAlignmentLeft;
        case LabelStyleDescription:
            return NSTextAlignmentLeft;
        case LabelStyleHeader:
            return NSTextAlignmentCenter;
        default:
            return NSTextAlignmentLeft;
    }
}

+ (UIColor *)textColorForStyle:(LabelStyle)style
{
    switch (style) {
            
        case LabelStyleDistance:
            return kDarkGrayColor;
        case LabelStyleSmallDistance:
            return kMediumGrayColor;
        case LabelStyleDescription:
            return kDarkGrayColor;
        case LabelStyleHeader:
            return kDarkGrayColor;
        case LabelStyleTitle:
            return kMarineBlueColor;
        default:
            return kDarkGrayColor;
    }
}

+ (UIFont *)fontForStyle:(LabelStyle)style
{
    switch (style) {
        case LabelStyleDistance:
            return kNormalRegularFont;
        case LabelStyleSmallDistance:
            return kSmallRegularFont;
        case LabelStyleDescription:
            return kNormalRegularFont;
        case LabelStyleHeader:
            return kBigBoldFont;
        case LabelStyleTitle:
            return kMediumRegularFont;
        default:
            return kNormalRegularFont;
    }
    return nil;
}

@end
