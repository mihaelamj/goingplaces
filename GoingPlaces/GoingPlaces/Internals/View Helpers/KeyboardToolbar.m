//
//  KeyboardToolbar.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "KeyboardToolbar.h"

@implementation KeyboardToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //set bar button
        [self setItems:@[self.doneButton]];
    }
    return self;
}

#pragma mark -
#pragma mark Public Properties - Views

- (UIBarButtonItem *)doneButton
{
    if (!_doneButton) {
        _doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:nil action:nil];
    }
    return _doneButton;
}

@end
