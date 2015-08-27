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

//@interface BNEnterprise()
//@property (nonatomic, retain) NSMutableArray *mutableWashers;
//@end

@class BNEmployee;
@class BNCashier;
@class BNWasher;
//@class BNVisitor;

@interface BNEnterprise()
- (void)enqueueVisitor:(BNVisitor *)visitor;
- (void)processVisitorsQueue;
- (id)getObjectForEmployee:(BNEmployee *)employee;

@end

@implementation BNEnterprise {
    unsigned int temp;
}
@synthesize state;

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
//        self.visitorsQueue   = [NSMutableArray initWithCapacity:kBNNumberOfCars];
        
        for (BNWasher *washer in self.washers) {
            [washer addObserver:self];
        }
        
        for (BNCashier *cashier in self.cashiers) {
            [cashier addObserver:self];
        }
        
        [self.bigBoss addObserver:self];
        
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods
- (void)runWithNumberOfCars:(NSUInteger)numberOfCars
                        price:(NSUInteger)price
{
    NSUInteger washersNumber = [self.washers count];
    for (NSUInteger counter = 0; counter < numberOfCars; counter++) {
        BNVisitor *visitor = [BNVisitor createWithMoney:price];
//        visitor.money = price;
//        [visitor addObserver:self];
        if (counter < washersNumber) {
            [[self.washers objectAtIndex:counter] performProcessWithObject:visitor];
        } else {
            [self performSelectorInBackground:@selector(enqueueVisitor:) withObject:visitor];
        }
    }
//    NSLog(@"Visitors:%d",temp);
}

- (void)processObject:(id<BNCashFlowProtocol>)object {

}

#pragma mark -
#pragma mark <BNStateProtocol>

- (void)objectDidBecomeFree:(id)object {
    id processObject = [self getObjectForEmployee:object];
    [(BNEmployee *)object performProcessWithObject:processObject];
    NSLog(@"%@ with %@", object, processObject);
}

- (void)objectDidBecomeBusy:(id)object {
    
}

- (void)objectDidFinishProcess:(BNEmployee *)object {
//    if (object != object.cashReceiver) {
//        [object.cashReceiver performProcessWithObject:object];
//    }
}

#pragma mark -
#pragma mark Private Methods
- (void)enqueueVisitor:(BNVisitor *)visitor {
    temp++;
        @synchronized(self.visitorsQueue) {
            [self.visitorsQueue addObject:visitor];
        }

    NSLog(@"Visitor %d received", temp);
}

- (void)processVisitorsQueue {
    do {
        
    } while (self.visitorsQueue.count > 0);
    
}

//- (BNEmployee *)getFreeEmployeeForObject:(id)object {
////    Class objectClass = [object class];
//    if ([object isKindOfClass:[BNBigBoss class]]) {
//        return self.bigBoss;
//    } else if ([object isKindOfClass:[BNCashier class]]) {
//        return self.bigBoss;
//    } else if ([object isKindOfClass:[BNWasher class]]) {
//        for (NSUInteger counter = 0; counter < [self.cashiers count]; counter++) {
//            BNEmployee *currentEmployee = self.cashiers[counter];
//            if (kBNObjectStateIsFree == currentEmployee.state) {
//                return currentEmployee;
//            }
//        }
//    } else if ([object isKindOfClass:[BNWasher class]]) {
//
//    
//    return nil;
//}

- (id)getObjectForEmployee:(BNEmployee *)employee {
    if ([employee isKindOfClass:[BNBigBoss class]]) {
        for (BNCashier *cashier in self.cashiers) {
            if (kBNObjectStateFinishedProcess == ((BNEmployee *)cashier).state) {
                return cashier;
            }
        }
    } else if ([employee isKindOfClass:[BNCashier class]]) {
        for (BNWasher *washer in self.washers) {
            if (kBNObjectStateFinishedProcess == ((BNEmployee *)washer).state) {
                return washer;
            }
        }
    } else if ([employee isKindOfClass:[BNWasher class]]) {
        NSUInteger visitorsInQueue = [self.visitorsQueue count];
        if (visitorsInQueue > 0) {
            BNVisitor *visitor = [self.visitorsQueue objectAtIndex:0];
            [self.visitorsQueue removeObjectAtIndex:0];
            return visitor;
        }
    }
    
    
    return nil;
}

@end
