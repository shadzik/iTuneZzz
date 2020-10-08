//
//  NSImage+TintColor.m
//  iTuneZzz
//
//  Created by Bartosz on 09/10/2018.
//  Copyright © 2018 Bartosz Świątek. All rights reserved.
//

#import "NSImage+TintColor.h"

@implementation NSImage (TintColor)

- (NSImage *)imageWithTintColor:(NSColor *)tintColor
{
    NSImage *image = [self copy];
    [image lockFocus];
    [tintColor set];
    NSRectFillUsingOperation(NSMakeRect(0, 0, image.size.width, image.size.height), NSCompositingOperationSourceAtop);
     
    [image unlockFocus];
    image.template = NO;
    
    return image;
}

@end
