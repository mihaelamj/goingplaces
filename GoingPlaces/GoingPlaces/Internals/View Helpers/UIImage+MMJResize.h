//
//  UIImage+MMJResize.h
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 19/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MMJResize)

+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
