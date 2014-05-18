//
//  StartView.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "StartView.h"

//Auto Layout
#import <Masonry/Masonry.h>

//styles
#import "Styles.h"

#import "UIButton+Style.h"

//sizes
#define kButtonWidthHeight 240

@implementation StartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //add button
        [self addSubview:self.startButton];
        
        //constraints
        [self setSubviewConstraints];
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods - Layout

- (void)setSubviewConstraints
{
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.greaterThanOrEqualTo(@(kButtonWidthHeight));
        make.height.greaterThanOrEqualTo(@(kButtonWidthHeight));
    }];
}

#pragma mark -
#pragma mark Public Properties - Views

- (UIButton *)startButton
{
    if (!_startButton) {
        _startButton = [UIButton buttonWithStyle:ButtonStyleStart];
        
        //round frame
        //half of the width/height to make a circle
        _startButton.layer.cornerRadius = kButtonWidthHeight / 2;
        
        //set border color and width
        _startButton.layer.borderColor = kDarkGrayColor.CGColor;
        _startButton.layer.borderWidth = 2.0f;
        
        //prepare for Auto Layout
        _startButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _startButton;
}

@end
