//
//  BSMenuBarIconView.h
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "BSMenuBarIconController.h"

@interface BSMenuBarIconView : NSView

@property (nonatomic, weak) id<BSMenuBarIconControllerDelegate> delegate;

@end
