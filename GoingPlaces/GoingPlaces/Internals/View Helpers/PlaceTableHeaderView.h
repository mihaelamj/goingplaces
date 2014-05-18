//
//  PlaceTableHeaderView.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceTableHeaderView : UIView

//input fields
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextView *addressTextView;

//labels
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

+ (NSInteger)suggestedHeight;

@end
