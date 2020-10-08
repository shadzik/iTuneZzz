//
//  BSPopoverViewController.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 13.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "BSPopoverViewController.h"
#import "BSAppDelegate.h"
#import "BSMenuBarIconController.h"

#import "iTunes.h"
#import "JESCircularProgressView.h"

#define kSecondsInHour  (60*60)
#define kSecondsInMinute 60

@interface BSPopoverViewController ()
{
    NSTimer *countdownTimer;
    NSUInteger remainingTicks;
    CGFloat degreeUnit;
}

@property (nonatomic) iTunesApplication *iTunesApp;
@property (nonatomic) IBOutlet NSTextField *hoursTextField;
@property (nonatomic) IBOutlet NSTextField *minutesTextField;
@property (nonatomic) IBOutlet NSTextField *secondsTextField;
@property (nonatomic) IBOutlet JESCircularProgressView *progressView;

- (IBAction) startCountdown:(id)sender;

@end

@implementation BSPopoverViewController

@synthesize iTunesApp;
@synthesize hoursTextField;
@synthesize minutesTextField;
@synthesize secondsTextField;
@synthesize progressView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.iTunesApp = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    }
    return self;
}

- (void)awakeFromNib
{
    [self.minutesTextField becomeFirstResponder];
    self.progressView.animationDuration = 0.5;
    self.progressView.outerLineWidth = 2;
    self.progressView.progressLineWidth = 2;
    self.progressView.tintColor = [NSColor redColor];    
}

- (IBAction) startCountdown:(id)sender
{
    if (countdownTimer)
    {
        [countdownTimer invalidate];
    }
    
    remainingTicks = ([self.hoursTextField.stringValue intValue] * kSecondsInHour) +
                    ([self.minutesTextField.stringValue intValue] * kSecondsInMinute) +
                    ([self.secondsTextField.stringValue intValue]);
    
    degreeUnit = 360.0/remainingTicks/360.0;
    
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(handleTimerTick)
                                                    userInfo:nil
                                                     repeats:YES];

    BSAppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    [appDelegate.iconController.popover performClose:self];
    
    self.progressView.progress = 1.0;
    [self.view addSubview:self.progressView positioned:NSWindowAbove relativeTo:nil];
}

-(void)handleTimerTick
{
    CGFloat progress = self.progressView.progress - degreeUnit;
    
    [self.progressView setProgress:progress animated:YES];
    
    if (remainingTicks <= 0)
    {
        [countdownTimer invalidate];
        countdownTimer = nil;
        [self iTunesPause:self];
        [self.progressView removeFromSuperview];
    }
    
    remainingTicks--;
}

- (void) iTunesPause:(id)sender
{
    [self.iTunesApp pause];
}

@end
