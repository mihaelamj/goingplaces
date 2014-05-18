//
//  PlaceImage.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 18/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceImage : NSObject

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) UIImage *thumbImage;

- (instancetype)initWithImageName:(NSString *)imageName imageUrl:(NSString *)imageUrl thumbImage:(UIImage *)thumbImage;

@end
