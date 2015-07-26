//
//  BNAccountant.m
//  Course
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNAccountant.h"
#import "BNCarwash.h"

@class BNBoss;

static NSString const *kBNAccountantMessageCountMoney = @"%@ is counting money... It's $%.02f";
static NSString const *kBNAccountantMessageNoMoneyToPaySalary = @"Not enough money to pay salary to %@";
static NSString const *kBNAccountantMessageSalaryPaid = @"The salary of $%6.02f is paid to: %@\n";

@interface BNAccountant()

- (void)countMoney;
- (void)paySalaryTo:(BNStaff *)staff;

@end

@implementation BNAccountant

#pragma mark -
#pragma mark Public Methods

- (void)performOperationHoursDuties:(BNCarwash *)object {
    [self countMoney];
}

- (void)performAfterOperationHoursDuties:(BNCarwash *)object {
    BNRoom  *office     = [[object building] office];
    BNStaff *staff;
    
    [self countMoney];
    while ([[[office persons] lastObject] class] != [BNBoss class]) {
        staff = [[office persons] lastObject];
        [self paySalaryTo:staff];
        [office removePerson:staff];
    }
    
    [self countMoney];
    [[[office persons] lastObject] receiveMoney:[self giveMoney:self.money - self.salary]];
    [self paySalaryTo:self];
    
    [self countMoney];
    [office removePerson:self];
}

#pragma mark -
#pragma mark Private Methods

- (void)countMoney {
    NSLog(kBNAccountantMessageCountMoney, self, [self money]);
}

- (void)paySalaryTo:(BNStaff *)staff {
    float salaryToPay = staff.salary;
    if (salaryToPay > self.money) {
        salaryToPay = self.money;
        NSLog(kBNAccountantMessageNoMoneyToPaySalary, staff);
    }
    [staff receiveMoney:[self giveMoney:salaryToPay]];
    NSLog(kBNAccountantMessageSalaryPaid, salaryToPay, staff);
}

@end
