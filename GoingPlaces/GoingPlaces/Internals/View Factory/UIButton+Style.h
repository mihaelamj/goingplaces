//
//  UIButton+Style.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonStyle) {
    ButtonStyleStart,
    ButtonStyleOk
};

@interface UIButton (Style)

+ (UIButton *)buttonWithStyle:(ButtonStyle)style;

@end
