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

//resize ans scale image
#import "UIImage+MMJResize.h"

//styles
#import "Styles.h"


@interface PlaceDetailViewController ()<UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate>

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
    
    //set row height
    self.mainView.tableView.rowHeight = [PlaceImageTableViewCell suggestedHeight];
    
    //set text filed and text view titles
    self.mainView.tableHeaderView.nameLabel.text = @"Name";
    self.mainView.tableHeaderView.addressLabel.text = @"Address";
    
    //set text filed placeholder text
    self.mainView.tableHeaderView.nameTextField.placeholder = @"name";
    
    //set Place properties
    self.mainView.tableHeaderView.nameTextField.text = self.place.name;
    self.mainView.tableHeaderView.addressTextView.text = self.place.address;
    
    //assign UITextField delegate to self, for all fields
    self.mainView.tableHeaderView.nameTextField.delegate = self;
    self.mainView.tableHeaderView.addressTextView.delegate = self;
    
    //setup keyboard toolbar
    [self.mainView.keyboardToolbar.doneButton setTarget:self];
    [self.mainView.keyboardToolbar.doneButton setAction:@selector(doneButtonClicked)];
    
    //place take picture button on navigation bar
    [self setupNavigationBar];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setupNavigationBar
{
    UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePictureButtonClicked)];
    self.navigationItem.rightBarButtonItem = cameraBarButtonItem;
}

#pragma mark -
#pragma mark View Actions

- (void)takePictureButtonClicked
{
    FWLog(@"Taking picture for place: %@", self.place.name);
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        //just camera
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //show picker controller
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)doneButtonClicked
{
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    [self addImage:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self updatePlaceName:textField.text];
}

#pragma mark -
#pragma mark UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //dismiss keyboard if enter is pressed
    if ([text hasSuffix:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self updatePlaceAddress:textView.text];
}

#pragma mark -
#pragma mark Private Methods

//@TODO: implement persistance

- (void)updatePlaceName:(NSString *)placeName
{
    self.place.name = placeName;
    FWLog(@"updated place name = %@", self.place.name);
}

- (void)updatePlaceAddress:(NSString *)placeAddress
{
    self.place.address = placeAddress;
    FWLog(@"updated place address = %@", self.place.address);
}

- (void)addImage:(UIImage *)image
{
    FWLog(@"adding image %@", image);
    
    //resize image to fit the thumb
    CGSize newSize = CGSizeMake(kThumbImageWidthHeight, kThumbImageWidthHeight);
    UIImage *thumbImage = [UIImage imageWithImage:image scaledToSize:newSize];
    
    //create a new PlaceImage with thumb and place name
    PlaceImage *placeImage = [[PlaceImage alloc] initWithImageName:[NSString stringWithFormat:@"%@ image", self.place.name] imageUrl:@"" thumbImage:thumbImage];
    
    //add it to place images
    [self.place.images addObject: placeImage];
    
    //reload table view
    //@TODO: reload just new cell
    [self.mainView.tableView reloadData];
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
