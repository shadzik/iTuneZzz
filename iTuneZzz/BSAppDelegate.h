//
//  BSAppDelegate.h
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSWindow+Popover.h"

@class BSMenuBarIconView;
@class BSMenuBarIconController;

@interface BSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) BSMenuBarIconView *iconView;
@property (nonatomic, strong) BSMenuBarIconController *iconController;

@end
