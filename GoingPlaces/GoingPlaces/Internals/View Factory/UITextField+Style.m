//
//  UITextField+Style.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "UITextField+Style.h"

#import "Styles.h"

@implementation UITextField (Style)

#pragma mark -
#pragma mark Public methods

+ (UITextField *)textFieldWithStyle:(TextFieldStyle)style
{
    UITextField *textField = [self textFieldForStyle:style];
    return textField;
}

#pragma mark -
#pragma mark Private methods

+ (UITextField *)textFieldForStyle:(TextFieldStyle)style
{
    //create text field
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
    
    //frame
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = kLightGrayColor.CGColor;
    
    //style text field
    textField.backgroundColor = [self backgroundColorForStyle:style];
    textField.textColor = [self textColorForStyle:style];
    textField.textAlignment = [self textAlignmentForStyle:style];
    textField.font = [self fontForStyle:style];
    
    //return styled text field
    return textField;
}

+ (NSTextAlignment)textAlignmentForStyle:(TextFieldStyle)style
{
    switch (style) {
        case TextFieldStyleName:
            return NSTextAlignmentLeft;
        default:
            return NSTextAlignmentLeft;
    }
}

+ (UIFont *)fontForStyle:(TextFieldStyle)style
{
    switch (style) {
        case TextFieldStyleName:
            return kNormalRegularFont
        default:
            return kNormalRegularFont;
    }
}

+ (UIColor *)textColorForStyle:(TextFieldStyle)style
{
    switch (style) {
        case TextFieldStyleName:
            return kDarkGrayColor;
        default:
            return kDarkGrayColor;
    }
}

+ (UIColor *)backgroundColorForStyle:(TextFieldStyle)style
{
    switch (style) {
        case TextFieldStyleName:
            return [UIColor whiteColor];
        default:
            return [UIColor clearColor];
    }
}

@end
