//
//  NSWindow+Popover.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 17.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "NSWindow+Popover.h"
#import "BSAppDelegate.h"
#import "BSMenuBarIconController.h"

@implementation NSWindow (Popover)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (BOOL)canBecomeKeyWindow
{
    if([self class]==NSClassFromString(@"NSStatusBarWindow"))
    {
        NSPopover *mainPopover = [[((BSAppDelegate*)[NSApp delegate]) iconController] popover];
        if(![mainPopover isShown])
            return NO;
    }
    
    return YES;
}

#pragma clang diagnostic pop

@end
