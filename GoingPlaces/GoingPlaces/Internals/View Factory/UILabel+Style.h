//
//  UILabel+Style.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LabelStyle) {
    LabelStyleDistance,
    LabelStyleSmallDistance,
    LabelStyleDescription,
    LabelStyleHeader,
    LabelStyleTitle,
    LabelStyleImageName
};

@interface UILabel (Style)

+ (UILabel *)labelWithStyle:(LabelStyle)style;

@end
