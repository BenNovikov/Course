//
//  SuperPooperMegaWasherTest.m
//  Course
//
//  Created by Admin on 15/07/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "SuperPooperMegaWasherTest.h"
#import "BNCarwash.h"
#import "BNBuilding.h"
#import "BNRoom.h"
#import "BNClient.h"
#import "BNBoss.h"
#import "BNAccountant.h"
#import "BNCarwasher.h"

static uint64_t const kBNWashBays                   = 3;
static uint64_t const kBNCarwashClientsMin          = 12;
static uint64_t const kBNCarwashClientsMax          = 40;
static uint64_t const kBNStaffCarwasherSalary       = 80;
static uint64_t const kBNStaffAccountantSalary      = 100;
static uint64_t const kBNStaffBossSalary            = 0;
static uint64_t const kBNStaffCarwasherExperience   = 1;
static uint64_t const kBNStaffAccountantExperience  = 5;
static uint64_t const kBNStaffBossExperience        = 10;
static float const kBNCarwashServicePrice           = 19.99;
static float const kBNCarwashClientMaxMoney         = 100;

@implementation SuperPooperMegaWasherTest

#pragma mark -
#pragma mark Public Method
+ (void)performTest {
    
    NSLog(@"*************************************************************\n");
    NSLog(@"          Super Pooper Mega Washer is OPEN NOW!\n");
    NSLog(@"   Full service with blackjack and hookers for only $%.02f!\n", kBNCarwashServicePrice);
    NSLog(@"*************************************************************");

//
//    Staff Initialization
//
    BNBoss *boss                = [BNBoss hireWithSalary:kBNStaffBossSalary
                                          withExperience:kBNStaffBossExperience];
    BNAccountant *accountant    = [BNAccountant hireWithSalary:kBNStaffAccountantSalary
                                                withExperience:kBNStaffAccountantExperience];
    NSArray *officeStaff = @[accountant, boss];
    
    NSMutableArray *carwashers  = [NSMutableArray arrayWithCapacity:kBNWashBays];
    NSMutableArray *bays        = [NSMutableArray arrayWithCapacity:kBNWashBays];
    
    for (NSUInteger index = 0; index < kBNWashBays; index++) {
        BNCarwasher *carwasher  = [BNCarwasher hireWithSalary:kBNStaffCarwasherSalary
                                               withExperience:kBNStaffCarwasherExperience];
        [carwashers insertObject:carwasher atIndex:index];
        BNRoom *bay = [BNRoom createRoomOfType:BNCarwashBay withPersons:[NSArray arrayWithObject:carwasher]];
        [bays insertObject:bay atIndex:index];
    }
    
    BNClient *client;
    
//
//    Building Setup
//   
    BNRoom *currentOffice   = [BNRoom createRoomOfType:BNCarwashOffice withPersons:officeStaff];
    BNBuilding *building    = [BNBuilding createWithOffice:currentOffice withBays:bays];
    
    BNCarwash *carWash      = [BNCarwash createWithBuilding:building];
    
    carWash = [BNCarwash createWithBuilding:building
                                   withBoss:boss
                             withAccountant:accountant
                             withCarwashers:carwashers];
    

    [carWash setPrice:kBNCarwashServicePrice];
    
    [[carwashers objectAtIndex:0] setBusy:NO];
    [[carwashers objectAtIndex:1] setBusy:NO];
    [[carwashers objectAtIndex:2] setBusy:YES];
    
//
//    Carwash Operations Simulation
//
    uint64_t clientsToday = arc4random_uniform(kBNCarwashClientsMax - kBNCarwashClientsMin) + kBNCarwashClientsMin;
    for (uint64_t index = 0; index < clientsToday; index++) {
        client = [BNClient createClientWithCleanCar:NO withMoney:arc4random_uniform(kBNCarwashClientMaxMoney)];
        [carWash washCarOf:client];
    }
    NSLog(@"..........It's late now! Sorry, but we gonna close!.........\n");
    [carWash closeDown];
}

@end
