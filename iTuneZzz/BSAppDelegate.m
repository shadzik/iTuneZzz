//
//  BSAppDelegate.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "BSAppDelegate.h"
#import "BSMenuBarIconView.h"
#import "BSMenuBarIconController.h"

@implementation BSAppDelegate

@synthesize statusItem;
@synthesize iconView;
@synthesize iconController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.iconController = [[BSMenuBarIconController alloc] init];
    
    self.iconView = [[BSMenuBarIconView alloc] init];
    self.iconView.delegate = self.iconController;
    
    CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:thickness];
    [self.statusItem setView:self.iconView];
}

//- (void)applicationDidResignActive:(NSNotification *)notification
//{
//    [self.iconController.popover performClose:self];
//}

@end
