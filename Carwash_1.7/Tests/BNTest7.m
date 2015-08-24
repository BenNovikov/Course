//
//  BNTest7.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNTest7.h"
#import "BNEnterprise.h"
#import "BNDirector.h"
#import "BNCashier.h"
#import "BNWasher.h"
#import "BNVisitor.h"


static uint64_t const kBNDirectorSalary = 100;
static uint64_t const kBNCashierSalary  = 70;
static uint64_t const kBNWasherSalary   = 50;

static uint64_t const kBNCashiers       = 1;
static uint64_t const kBNWashers        = 50;

//static uint64_t const kBNWashBays                   = 3;
//static uint64_t const kBNCarwashClientsMin          = 12;
//static uint64_t const kBNCarwashClientsMax          = 40;
//static uint64_t const kBNStaffCarwasherSalary       = 80;
//static uint64_t const kBNStaffAccountantSalary      = 100;
//static uint64_t const kBNStaffBossSalary            = 0;
//static uint64_t const kBNStaffCarwasherExperience   = 1;
//static uint64_t const kBNStaffAccountantExperience  = 5;
//static uint64_t const kBNStaffBossExperience        = 10;
//static float const kBNCarwashServicePrice           = 19.99;
//static float const kBNCarwashClientMaxMoney         = 100;

@implementation BNTest7

#pragma mark -
#pragma mark Public Method
+ (void)performTest {
    
//    BNCashier *cashier = ;
    NSArray *cashiers = @[[BNCashier hireWithSalary:kBNCashierSalary]];
    
    NSMutableArray *testWashers = [NSMutableArray arrayWithCapacity:kBNWashers];
    for (NSUInteger index = 0; index < kBNWashers; index++) {
        [testWashers addObject:[BNWasher hireWithSalary:kBNWasherSalary]];
    }
    NSArray *washers = [NSArray arrayWithArray:testWashers];
    [testWashers release];
    
    BNEnterprise *carwash = [BNEnterprise createWithDirector:[BNDirector hireWithSalary:kBNDirectorSalary]
                                                    cashiers:cashiers
                                                     washers:washers];


};

@end
