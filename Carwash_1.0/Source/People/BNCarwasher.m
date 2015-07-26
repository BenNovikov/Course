//
//  BNCarwasher.m
//  Course
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwasher.h"
#import "BNCarwash.h"

static NSString const *kBNCarwasherMessageCarIsCleaned = @"%@ car is clean now. Service paid:$%5.02f\n";
static NSString const *kBNCarwasherMessageWashingCar = @"%@ is washing the car of:%@\n";

@interface BNCarwasher()

- (void)washCarOfClient:(BNClient *)client;

@end

@implementation BNCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)performOperationHoursDuties:(BNCarwash *)object {
    BNClient    *client = [self.currentLocation.persons lastObject];
    [self washCarOfClient:client];
    
    if ([client isClean]) {
        [self receiveMoney:[client giveMoney:object.price]];
        [self.currentLocation removePerson:client];
        NSLog(kBNCarwasherMessageCarIsCleaned, client, object.price);
    }
}

- (void)performAfterOperationHoursDuties:(BNCarwash *)object {
    [self.currentLocation removePerson:self];
    BNRoom *carwashOffice = object.building.office;
    BNAccountant *Accountant = [carwashOffice.persons firstObject];
    [carwashOffice addPerson:self];
    [Accountant receiveMoney:[self giveMoney:self.money]];
}

#pragma mark -
#pragma mark Private Methods

- (void)washCarOfClient:(BNClient *)client {
    NSAssert(nil != client, @"Something is wrong! There is no car in the bay!");
    
    [self setBusy:YES];
    NSLog(kBNCarwasherMessageWashingCar, self, client);
    [client setClean:YES];
    [self setBusy:NO];
}

@end
