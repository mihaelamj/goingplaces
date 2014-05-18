//
//  UITextView+Style.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TextViewStyle) {
    TextViewStyleAddress
};

@interface UITextView (Style)

+ (UITextView *)textViewWithStyle:(TextViewStyle)style;

@end
