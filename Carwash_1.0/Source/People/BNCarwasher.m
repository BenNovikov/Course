//
//  BNCarwasher.m
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwasher.h"

@implementation BNCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)washCarOfClient:(BNRoom *)location {
    BNClient *client = location.persons.lastObject;
    NSAssert(nil != client, @"Something is wrong! There is no car in the bay!");
    [client setIsClean:YES];
}

- (void)performStaffSpecificOperation:(BNRoom *)location {
    [self washCarOfClient:(BNRoom *)location];
}

@end
