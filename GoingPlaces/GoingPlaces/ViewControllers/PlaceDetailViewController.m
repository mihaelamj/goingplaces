//
//  PlaceDetailViewController.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "PlaceDetailViewController.h"

//main view
#import "PlaceDetailView.h"

//table view cell
#import "PlaceImageTableViewCell.h"

//place images data source
#import "PlaceImagesDataSource.h"


@interface PlaceDetailViewController ()

//view
@property (nonatomic, strong) PlaceDetailView *mainView;

//objects
@property (nonatomic, strong) Place *place;
@property (nonatomic, strong) PlaceImagesDataSource *placeImagesDataSource;

@end

@implementation PlaceDetailViewController

#pragma mark -
#pragma mark Init

- (instancetype)initWithPlace:(Place *)place
{
    self = [super init];
    if (self) {
        _place = place;
    }
    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)loadView
{
    //set title
    self.title = self.place.name;
    
    //create main view
    self.mainView = [[PlaceDetailView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.mainView;
    
    //register cell class
    [self.mainView.tableView registerClass:[PlaceImageTableViewCell class] forCellReuseIdentifier:[PlaceImageTableViewCell reusableIdentifier]];
    
    //table view data source
    self.mainView.tableView.dataSource = self.placeImagesDataSource;
    
    //set text filed and text view titles
    self.mainView.tableHeaderView.nameLabel.text = @"Name";
    self.mainView.tableHeaderView.addressLabel.text = @"Address";
    
    //set text filed placeholder text
    self.mainView.tableHeaderView.nameTextField.placeholder = @"name";
    
    //set Place properties
    self.mainView.tableHeaderView.nameTextField.text = self.place.name;
    self.mainView.tableHeaderView.addressTextView.text = self.place.address;
    
    //assign UITextField delegate to self, for all fields
//    self.mainView.tableHeaderView.nameTextField.delegate = self;
//    self.mainView.tableHeaderView.addressTextView.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark Private Properties

- (PlaceImagesDataSource *)placeImagesDataSource
{
    if (!_placeImagesDataSource) {
        _placeImagesDataSource = [[PlaceImagesDataSource alloc] initWithPlace:self.place];
    }
    return _placeImagesDataSource;
}


@end
