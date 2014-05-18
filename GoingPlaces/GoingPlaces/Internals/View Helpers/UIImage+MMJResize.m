//
//  UIImage+MMJResize.m
//  GoingPlaces
//
//  Created by Mihaela Mihaljević Jakić on 19/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "UIImage+MMJResize.h"

@implementation UIImage (MMJResize)

+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
