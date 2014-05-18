//
//  UITextView+Style.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "UITextView+Style.h"

#import "Styles.h"

@implementation UITextView (Style)

#pragma mark -
#pragma mark Public methods

+ (UITextView *)textViewWithStyle:(TextViewStyle)style
{
    UITextView *textView = [self textViewForStyle:style];
    return textView;
}

#pragma mark -
#pragma mark Private methods

+ (UITextView *)textViewForStyle:(TextViewStyle)style
{
    //create text view
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero];
    
    //frame
    textView.backgroundColor = [UIColor whiteColor];
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = kLightGrayColor.CGColor;
    
    //style text view
    textView.backgroundColor = [self backgroundColorForStyle:style];
    textView.textColor = [self textColorForStyle:style];
    textView.textAlignment = [self textAlignmentForStyle:style];
    textView.font = [self fontForStyle:style];
    
    //return styled text view
    return textView;
}

+ (NSTextAlignment)textAlignmentForStyle:(TextViewStyle)style
{
    switch (style) {
        case TextViewStyleAddress:
            return NSTextAlignmentLeft;
        default:
            return NSTextAlignmentLeft;
    }
}

+ (UIFont *)fontForStyle:(TextViewStyle)style
{
    switch (style) {
        case TextViewStyleAddress:
            return kNormalRegularFont
        default:
            return kNormalRegularFont;
    }
}

+ (UIColor *)textColorForStyle:(TextViewStyle)style
{
    switch (style) {
        case TextViewStyleAddress:
            return kDarkGrayColor;
        default:
            return kDarkGrayColor;
    }
}

+ (UIColor *)backgroundColorForStyle:(TextViewStyle)style
{
    switch (style) {
        case TextViewStyleAddress:
            return [UIColor whiteColor];
        default:
            return [UIColor clearColor];
    }
}

@end
