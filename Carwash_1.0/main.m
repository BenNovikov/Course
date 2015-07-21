//
//  main.m
//  Carwash
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNCarwash.h"
#import "BNBuilding.h"
#import "BNRoom.h"
#import "BNClient.h"
#import "BNManager.h"
#import "BNAccountant.h"
#import "BNCarwasher.h"

static uint64_t const kBNCarwashClientsMin          = 10;
static uint64_t const kBNCarwashClientsMax          = 30;
static uint64_t const kBNStaffCarwasherSalary       = 80;
static uint64_t const kBNStaffAccountantSalary      = 100;
static uint64_t const kBNStaffManagerSalary         = 150;
static uint64_t const kBNStaffCarwasherExperience   = 1;
static uint64_t const kBNStaffAccountantExperience  = 5;
static uint64_t const kBNStaffManagerExperience     = 10;
static float const kBNCarwashServicePrice           = 19.99;
static float const kBNCarwashClientMaxMoney         = 500;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\n**********************************************************\n        Super Pooper Mega Washer is OPEN NOW!\n Full service with blackjack and hookers for only $%.02f!\n**********************************************************", kBNCarwashServicePrice);
        
        BNManager *manager   = [BNManager hireWithSalary:kBNStaffManagerSalary
                                          withExperience:kBNStaffManagerExperience];
        
        BNAccountant *accountant = [BNAccountant hireWithSalary:kBNStaffAccountantSalary
                                                 withExperience:kBNStaffAccountantExperience];
        
        BNCarwasher *carwasher  = [BNCarwasher hireWithSalary:kBNStaffCarwasherSalary
                                               withExperience:kBNStaffCarwasherExperience];
        
        BNCarwash *carWash = [BNCarwash createWithManager:manager withAccountant:accountant withCarwasher:carwasher];
        BNClient *client;
        [carWash setPrice:kBNCarwashServicePrice];
        
        uint64_t clientsToday = arc4random_uniform(kBNCarwashClientsMax - kBNCarwashClientsMin) + kBNCarwashClientsMin;
        for (uint64_t index = 0; index < clientsToday; index++) {
            client = [BNClient createClientWithCleanCar:NO withMoney:arc4random_uniform(kBNCarwashClientMaxMoney)];
            BOOL cleaned = [carWash washCarOf:client];
            if (cleaned) {
                //                NSLog(@"%@ car is clean now\n", client);
            } else {
                //                NSLog(@"%@ car has gone away holding his %.02f\n", client, [client money]);
            }
        }
        NSLog(@"Sorry! Time is over! It's closed now!");
        [carWash closeDown];
        
    }
    
    return 0;
}
