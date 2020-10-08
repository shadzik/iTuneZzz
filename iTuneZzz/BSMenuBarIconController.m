//
//  BSMenuBarIconController.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "BSMenuBarIconController.h"

#import "BSAppDelegate.h"
#import "BSPopoverViewController.h"
#import "BSMenuBarIconView.h"

@implementation BSMenuBarIconController

@synthesize popover;

- (void) setupPopover
{
    if (!self.popover)
    {
        self.popover = [[NSPopover alloc] init];
        self.popover.contentViewController = [[BSPopoverViewController alloc] init];
        self.popover.behavior = NSPopoverBehaviorTransient;
    }
}

- (void)menuletClicked
{
    BSAppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];

    [self setupPopover];
    [self.popover showRelativeToRect:[appDelegate.iconView frame]
                              ofView:appDelegate.iconView
                       preferredEdge:NSMinYEdge];
}

- (void)rightClick
{
    [self.popover performClose:self];
}

@end
