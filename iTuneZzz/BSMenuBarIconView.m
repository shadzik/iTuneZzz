//
//  BSMenuBarIconView.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "BSMenuBarIconView.h"
#import "BSAppDelegate.h"
#import "NSImage+TintColor.h"

static NSString *kActiveChangedContext = @"kActiveChangedContext";

@implementation BSMenuBarIconView

@synthesize delegate;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setMenu:[self updateRightMenu]];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor clearColor] set];
    NSImage *icon = [NSImage imageNamed:@"logo"];
    NSColor *color = [NSColor colorNamed:@"defaultColor"];
    icon = [icon imageWithTintColor:color];
    [icon drawInRect:NSInsetRect(dirtyRect, 2, 2) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

- (void)setDelegate:(id<BSMenuBarIconControllerDelegate>)newDelegate
{
    [(NSObject *)newDelegate addObserver:self forKeyPath:@"active" options:NSKeyValueObservingOptionNew context:(__bridge void *)(kActiveChangedContext)];
    delegate = newDelegate;
}

- (NSMenu*)updateRightMenu
{
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Right Menu"];
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];

    NSString *quitMenuItemString = [NSString stringWithFormat:@"%@ %@", @"Quit", appName];
    
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:quitMenuItemString action:@selector(terminate:) keyEquivalent:@""];
    
    [menu addItem:item];
    
    return menu;
}

- (void)mouseDown:(NSEvent *)event
{
    [self.delegate menuletClicked];
}

- (void)rightMouseDown:(NSEvent *)theEvent
{
    [self.delegate rightClick];
    BSAppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    [appDelegate.statusItem popUpStatusItemMenu:self.menu];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == (__bridge void *)(kActiveChangedContext))
    {
        [self setNeedsDisplay:YES];
    }
}

@end
