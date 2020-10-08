//
//  BSDecimalNumberFormatter.m
//  iTuneZzz
//
//  Created by Bartosz Świątek on 18.06.2014.
//  Copyright (c) 2014 Bartosz Świątek. All rights reserved.
//

#import "BSDecimalNumberFormatter.h"

@implementation BSDecimalNumberFormatter

- (BOOL)isPartialStringValid:(NSString*)partialString newEditingString:(NSString**)newString errorDescription:(NSString**)error
{
    if([partialString length] == 0)
    {
        return YES;
    }
    
    NSScanner* scanner = [NSScanner scannerWithString:partialString];
    
    if(!([scanner scanInt:0] && [scanner isAtEnd]))
    {
        NSBeep();
        return NO;
    }
    
    if ([partialString length] > 2)
    {
        NSBeep();
        return NO;
    }
    
    if ([partialString intValue] > [self.maximum intValue])
    {
        NSBeep();
        return NO;
    }

    
    return YES;
}

@end
