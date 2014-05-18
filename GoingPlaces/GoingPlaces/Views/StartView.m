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

//sizes
#define kButtonWidthHeight 240

//colors
#define kTextBorderColor [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1.0f]
#define kButtonBackgorundColor  [UIColor colorWithRed:74.0f/255.0f green:144.0f/255.0f blue:226.0f/255.0f alpha:1.0f]

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
        _startButton = [[UIButton alloc] init];
        
        //create button
        _startButton= [UIButton buttonWithType:UIButtonTypeCustom];
        
        //prepare for AL
        _startButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        //style button
        _startButton.backgroundColor = kButtonBackgorundColor;
        _startButton.titleLabel.font = [UIFont boldSystemFontOfSize:40];
        _startButton.titleLabel.textColor = kTextBorderColor;
        
        //round frame
        //half of the width/height to make a circle
        _startButton.layer.cornerRadius = kButtonWidthHeight / 2;
        
        //set border color and width
        _startButton.layer.borderColor = kTextBorderColor.CGColor;
        _startButton.layer.borderWidth = 2.0f;
    }
    return _startButton;
}

@end
