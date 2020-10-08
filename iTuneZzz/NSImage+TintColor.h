//
//  NSImage+TintColor.h
//  iTuneZzz
//
//  Created by Bartosz on 09/10/2018.
//  Copyright © 2018 Bartosz Świątek. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSImage (TintColor)

- (NSImage *)imageWithTintColor:(NSColor *)tintColor;

@end

NS_ASSUME_NONNULL_END
