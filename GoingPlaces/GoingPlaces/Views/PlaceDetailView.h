//
//  PlaceDetailView.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

//custom view holding place name and addres
#import "PlaceTableHeaderView.h"

@interface PlaceDetailView : UIView

@property (nonatomic, strong) PlaceTableHeaderView *tableHeaderView;
@property (nonatomic, strong) UITableView *tableView;

@end
