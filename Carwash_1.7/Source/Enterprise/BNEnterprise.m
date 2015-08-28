//
//  BNEnterprise.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEnterprise.h"
#import "BNEmployee.h"
#import "BNVisitor.h"
#import "BNBigBoss.h"
#import "BNCashier.h"
#import "BNWasher.h"

@interface BNEnterprise()
@property (nonatomic, retain) BNBigBoss         *bigBoss;
@property (nonatomic, retain) NSMutableArray    *cashiers;
@property (nonatomic, retain) NSMutableArray    *washers;
@property (nonatomic, retain) NSMutableArray    *visitorsQueue;

- (void)enqueueVisitor:(BNVisitor *)visitor;

@end

@implementation BNEnterprise

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

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.bigBoss = nil;
    self.cashiers = nil;
    self.washers = nil;
    self.visitorsQueue = nil;
    
    [super dealloc];
}

- (instancetype)initWithBigBoss:(BNBigBoss *)bigBoss
                        cashiers:(NSArray *)cashiers
                         washers:(NSArray *)washers
{
    if (self = [super init]) {
        self.bigBoss    = bigBoss;
        self.cashiers   = [NSMutableArray arrayWithArray:cashiers];
        self.washers    = [NSMutableArray arrayWithArray:washers];
        self.visitorsQueue   = [[NSMutableArray new] autorelease];
        
        BNCashier *cashier = self.cashiers[0];
        
        
        for (BNWasher *washer in self.washers) {
            [washer addObserver:self];
            [washer addObserver:cashier];
        }
        
        for (BNCashier *cashier in self.cashiers) {
//            [cashier addObserver:self];
            [cashier addObserver:self.bigBoss];
        }
        
        [self.bigBoss addObserver:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)runWithNumberOfCars:(NSUInteger)numberOfCars

{
    NSUInteger washersNumber = [self.washers count];
    for (NSUInteger counter = 0; counter < numberOfCars; counter++) {
        BNVisitor *visitor = [BNVisitor createWithMoney:kBNServicePrice];

        if (counter < washersNumber) {
            [self.washers[counter] performProcessWithObject:visitor];
        } else {
            [self performSelectorInBackground:@selector(enqueueVisitor:) withObject:visitor];
        }
        
        for (BNWasher *washer in self.washers) {
            washer.state = kBNObjectStateIsFree;
        }
    }
}

#pragma mark -
#pragma mark <BNStateProtocol>

- (void)objectDidBecomeFree:(BNEmployee *)object {
//    NSLog(kBNLogBecomeFree, [object class], object, object.processedObject, object.money);
    if ([object isKindOfClass:[BNWasher class]]) {
        @synchronized(self) {
            id processObject = [self.visitorsQueue firstObject];
            if (processObject && object.state == kBNObjectStateIsFree) {
                [self.visitorsQueue removeObjectAtIndex:0];
                [object performProcessWithObject:processObject];
            }
        }
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
        @synchronized(self.visitorsQueue) {
            [self.visitorsQueue addObject:visitor];
        }
    }
}

@end
