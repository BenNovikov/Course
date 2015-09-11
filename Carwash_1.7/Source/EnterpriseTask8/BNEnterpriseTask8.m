//
//  BNEnterpriseTask8.m
//  Course
//
//  Created by Admin on 15/09/01/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEnterpriseTask8.h"
#import "BNEmployee.h"
#import "BNVisitor.h"
#import "BNBigBoss.h"
#import "BNCashier.h"
#import "BNWasher.h"
#import "BNDispatcher.h"

@interface BNEnterpriseTask8()
@property (nonatomic, retain) BNBigBoss     *bigBoss;
@property (nonatomic, retain) BNDispatcher  *bigBossDispatcher;
@property (nonatomic, retain) BNDispatcher  *cashiersDispatcher;
@property (nonatomic, retain) BNDispatcher  *washersDispatcher;

@end

@implementation BNEnterpriseTask8

#pragma mark -
#pragma mark Class Methods

+ (id)createWithBigBoss:(BNBigBoss *)bigBoss
               cashiers:(NSArray *)cashiers
                washers:(NSArray *)washers
{
    return [[[self alloc] initWithBigBoss:(BNBigBoss *)bigBoss
                                 cashiers:(NSArray *)cashiers
                                  washers:(NSArray *)washers]
            autorelease];
}

+ (BNEnterpriseTask8 *)createWithRandomCashiers:(NSUInteger)numberOfCashiers
                                  randomWashers:(NSUInteger)numberOfWashers
{
    NSMutableArray *cashiers = [NSMutableArray arrayWithCapacity:numberOfCashiers];
    for (NSUInteger index = 0; index < numberOfCashiers; index++) {
        [cashiers addObject:[BNCashier hireWithSalary:kBNCashierSalary]];
    }
    NSMutableArray *washers = [NSMutableArray arrayWithCapacity:numberOfWashers];
    for (NSUInteger index = 0; index < numberOfWashers; index++) {
        [washers addObject:[BNWasher hireWithSalary:kBNWasherSalary]];
    }
    BNBigBoss *bigBoss = [BNBigBoss hireWithSalary:kBNBigBossSalary];
    
    
    return [[[self alloc] initWithBigBoss:(BNBigBoss *)bigBoss
                                 cashiers:(NSArray *)cashiers
                                  washers:(NSArray *)washers]
            autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.bigBoss            = nil;
    self.bigBossDispatcher  = nil;
    self.cashiersDispatcher = nil;
    self.washersDispatcher  = nil;
    
    [super dealloc];
}

- (instancetype)initWithBigBoss:(BNBigBoss *)bigBoss
                       cashiers:(NSArray *)cashiers
                        washers:(NSArray *)washers
{
    self = [super init];
    if (self) {
        self.bigBossDispatcher  = [BNDispatcher  createWithQueue:cashiers handlers:[NSArray arrayWithObject:bigBoss]];
        self.cashiersDispatcher = [BNDispatcher  createWithQueue:washers handlers:cashiers];
        self.washersDispatcher  = [BNDispatcher  createWithQueue:[NSArray array] handlers:washers];
        
//        BNCashier *cashier = self.cashiers[0];
//        
//        for (BNWasher *washer in self.washers) {
//            [washer addObserver:self];
//            [washer addObserver:cashier];
//        }
//        
//        for (BNCashier *cashier in self.cashiers) {
//            [cashier addObserver:self.bigBoss];
//        }
        
        [self.bigBoss addObserver:self];
    }
    
    return self;
}


#pragma mark -
#pragma mark Public Methods

- (void)runWithNumberOfCars:(NSUInteger)numberOfCars

{
    for (NSUInteger counter = 0; counter < numberOfCars; counter++) {
        BNVisitor *visitor = [BNVisitor createWithMoney:kBNServicePrice];

        [self performSelectorInBackground:@selector(enqueueVisitor:) withObject:visitor];
    }
}

#pragma mark -
#pragma mark <BNStateProtocol>

- (void)objectDidBecomeFree:(BNEmployee *)object {
    //    NSLog(kBNLogBecomeFree, [object class], object, object.processedObject, object.money);
    if ([object isKindOfClass:[BNWasher class]]) {

    }
}

- (void)objectDidBecomeBusy:(BNEmployee *)object {
    //    NSLog(kBNLogBecomeBusy, [object class], object, object.processedObject, object.money);
}

- (void)objectDidFinishProcess:(BNEmployee *)object {
    //    NSLog(kBNLogFinishProcess, [object class], object, object.processedObject, object.money);
}

#pragma mark -
#pragma mark Private Methods

- (void)enqueueVisitor:(BNVisitor *)visitor {
    @autoreleasepool {
        @synchronized(self.washersDispatcher) {
//            [self.washersDispatcher enqueueObject:visitor];
            //add object processor from dispatcher to enqueue object
        }
    }
}

@end

