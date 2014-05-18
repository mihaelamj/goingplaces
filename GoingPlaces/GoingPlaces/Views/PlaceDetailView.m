//
//  PlaceDetailView.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceDetailView.h"

//styles
#import "Styles.h"

@implementation PlaceDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //add table view
        [self addSubview:self.tableView];
        
    }
    return self;
}

#pragma mark -
#pragma mark Public Properties - Views

- (PlaceTableHeaderView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[PlaceTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [PlaceTableHeaderView suggestedHeight])];
        
        //set input accessory view for input controls
        _tableHeaderView.nameTextField.inputAccessoryView = self.keyboardToolbar;
        _tableHeaderView.addressTextView.inputAccessoryView = self.keyboardToolbar;
    }
    return _tableHeaderView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.backgroundColor = kVeryLightGrayColor;
        
        //add table header to table
        _tableView.tableHeaderView = self.tableHeaderView;
        
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.separatorColor = kLightGrayColor;
    }
    
    return _tableView;
}

- (KeyboardToolbar *)keyboardToolbar
{
    if (!_keyboardToolbar) {
        _keyboardToolbar = [[KeyboardToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 44)];
        [_keyboardToolbar sizeToFit];
    }
    return _keyboardToolbar;
}

@end
