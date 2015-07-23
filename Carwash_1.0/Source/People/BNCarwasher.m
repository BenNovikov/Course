//
//  BNCarwasher.m
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwasher.h"
#import "BNCarwash.h"

@interface BNCarwasher()

- (void)washCarOfClient:(BNClient *)client;

@end

@implementation BNCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)performOperationHoursDuties:(BNCarwash *)object {
    BNRoom      *currentRoom = [self currentLocation];
    BNClient    *client = [[currentRoom persons]lastObject];
    [self washCarOfClient:client];
    
    if ([client isClean]) {
        [self receiveMoney:[client giveMoney:[object price]]];
        [[self currentLocation] removePerson:client];
        NSLog(@"%@ car is clean now. Service paid:$%5.02f\n", client, [object price]);
    } else {
        NSLog(@"Something's wrong!!!");
    }
}

- (void)performAfterOperationHoursDuties:(BNCarwash *)object {
    [[self currentLocation] removePerson:self];
    BNRoom *carwashOffice = [[object building] office];
    [carwashOffice addPerson:self];
    [[[carwashOffice persons] firstObject] receiveMoney:[self giveMoney:[self money]]];
}

#pragma mark -
#pragma mark Private Methods

- (void)washCarOfClient:(BNClient *)client {
    NSAssert(nil != client, @"Something is wrong! There is no car in the bay!");
    
    [self setIsBusy:YES];
    NSLog(@"%@ is washing the car of:%@\n", self, client);
    [client setIsClean:YES];
    [self setIsBusy:NO];
}

@end
