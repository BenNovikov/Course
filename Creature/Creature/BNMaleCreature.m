//
//  BNMaleCreature.m
//  Human
//
//  Created by Admin on 7/14/15.
//  Copyright © 2015 ___BasicNotation___. All rights reserved.
//

#import "BNMaleCreature.h"
static NSString * const kBNMakeWarMessage = @"%@ gonna make war!";

@implementation BNMaleCreature

#pragma mark -
#pragma mark Public Methods

- (void)makeWar {
    NSLog(kBNMakeWarMessage, self.name);
}

- (void)performGenderSpecificOperation {
    [super performGenderSpecificOperation];
    [self makeWar];
}

@end
