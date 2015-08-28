//
//  BNTest7.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNTest7.h"
#import "BNWorkflow.h"
#import "BNActor.h"
#import "BNConstants.h"

#import "BNEnterprise.h"
#import "BNBigBoss.h"
#import "BNCashier.h"
#import "BNWasher.h"
#import "BNVisitor.h"

@implementation BNTest7

#pragma mark -
#pragma mark Public Method
+ (void)performTest {

    NSArray *cashiers = @[[BNCashier hireWithSalary:kBNCashierSalary]];
    
    NSMutableArray *washers = [NSMutableArray arrayWithCapacity:kBNNumberOfWashers];
    for (NSUInteger index = 0; index < kBNNumberOfWashers; index++) {
        [washers addObject:[BNWasher hireWithSalary:kBNWasherSalary]];
    }

    BNBigBoss *bigboss = [BNBigBoss hireWithSalary:kBNBigBossSalary];
    BNEnterprise *carwash = [BNEnterprise createWithBigBoss:bigboss
                                                   cashiers:cashiers
                                                    washers:washers];
    
    NSLog(@"Starting...");
    [carwash runWithNumberOfCars:kBNNumberOfCars
                           price:kBNServicePrice];
    
    NSLog(@"Finishing...");
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:500]];
};

@end
