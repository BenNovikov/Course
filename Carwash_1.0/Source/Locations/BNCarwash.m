//
//  BNCarwash.m
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwash.h"

@interface BNCarwash()

- (void)paySalaryTo:(BNStaff *)staff;

@end

@implementation BNCarwash
@synthesize building;
@synthesize price;

#pragma mark -
#pragma mark Class Methods
+ (id)createWithBoss:(BNStaff *)Boss
          withAccountant:(BNStaff *)accountant
           withCarwasher:(BNStaff *)carwasher
{
    
    return [[[self alloc] initWithBoss:(BNStaff *)Boss
                            withAccountant:(BNStaff *)accountant
                             withCarwasher:(BNStaff *)carwasher] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.building = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithBoss:nil withAccountant:nil withCarwasher:nil];
}

- (instancetype)initWithBoss:(BNStaff *)Boss
                 withAccountant:(BNStaff *)accountant
                  withCarwasher:(BNStaff *)carwasher
{
    self = [super init];
    if(self){
        NSArray *bayStaff = [NSArray arrayWithObject:carwasher];
        BNRoom *bay = [BNRoom createRoomOfType:BNCarwashBay withPersons:bayStaff];
        NSArray *officeStaff = [NSArray arrayWithObjects:accountant, Boss, nil];
        BNRoom *office = [BNRoom createRoomOfType:BNCarwashBay withPersons:officeStaff];
        BNBuilding *currentBuilding = [BNBuilding createWithOffice:office withBay:bay];        
        self.building = currentBuilding;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods
- (BOOL)washCarOf:(BNClient *)client {
    if (nil != client && price <= [client money]) {
        BNRoom *bay = [building bay];
        BNStaff *carwasher = bay.persons.firstObject;
        NSAssert(nil != carwasher, @"Something's wrong! There is no carwasher in the bay!");

        [bay addPerson:client];
        [carwasher performStaffSpecificOperation:bay];
        if ([client isClean]) {
            [carwasher receiveMoney:[client giveMoney:[self price]]];
        }
        [bay removePerson:client];
    }
    
    return [client isClean];
}

- (void)closeDown {
    if (nil != self) {       
        BNRoom *bay = self.building.bay;
        BNRoom *office = self.building.office;
        BNStaff *carwasher = bay.persons.firstObject;
        BNStaff *accountant = office.persons.firstObject;
        BNStaff *Boss = office.persons.lastObject;
        
        [accountant receiveMoney:[carwasher giveMoney:[carwasher money]]];
        [accountant performStaffSpecificOperation:office];
        [self paySalaryTo:carwasher];
        [self paySalaryTo:accountant];
        [Boss   receiveMoney:[accountant giveMoney:([accountant  money] - [accountant salary])]];
        [accountant performStaffSpecificOperation:office];
        [Boss performStaffSpecificOperation:office];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)paySalaryTo:(BNStaff *)staff {
    BNStaff *accountant = self.building.office.persons.firstObject;
    float salaryToPay = [staff salary];
    if (salaryToPay > accountant.money) {
        salaryToPay = accountant.money;
        NSLog(@"Not enough money to pay salary to %@", staff);
    }
    [staff receiveMoney:[accountant giveMoney:(salaryToPay)]];
    NSLog(@"The salary of $%6.02f is paid to: %@\n", salaryToPay, staff);
}

@end
