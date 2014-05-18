//
//  PlaceDetailViewController.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

//model
#import "Place.h"

@interface PlaceDetailViewController : UIViewController

- (instancetype)initWithPlace:(Place *)place;

@end
