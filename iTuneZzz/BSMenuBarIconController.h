//
//  BSMenuBarIconController.h
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BSMenuBarIconControllerDelegate <NSObject>

- (void)menuletClicked;
- (void)rightClick;

@end

@interface BSMenuBarIconController : NSObject <BSMenuBarIconControllerDelegate>

@property (nonatomic, strong) NSPopover *popover;

@end
