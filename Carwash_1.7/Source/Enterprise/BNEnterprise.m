//
//  BNEnterprise.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEnterprise.h"
#import "BNVisitor.h"

//@interface BNEnterprise()
//@property (nonatomic, retain) NSMutableArray *mutableWashers;
//@end

@class BNEmployee;
@class BNCashier;
@class BNWasher;
//@class BNVisitor;

@interface BNEnterprise()
- (BNVisitor *)receiveVisitor;

@end

@implementation BNEnterprise
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
        
        for (BNWasher *washer in self.washers) {
            [washer addObserver:self.cashiers[0]]; //there is only one cashier yet!
        }
        [self.cashiers[0] addObserver:self.bigBoss];
        [self.bigBoss addObserver:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods
- (void)runWithNumberOfCars:(NSUInteger)numberOfCars
                        price:(NSUInteger)price
{

    
    for (NSUInteger counter = 0; counter < numberOfCars; counter++) {
        BNVisitor *visitor = [[self receiveVisitor] autorelease];
        visitor.price = price;
        [self performSelectorInBackground:@selector(processObject:) withObject:visitor];
    }
}

- (void)processObject:(id<BNCashFlowProtocol>)object {
    
}

#pragma mark -
#pragma mark <BNStateProtocol>

- (void)objectDidBecomeFree:(id)object {
    
}

- (void)objectDidBecomeBusy:(id)object {
    
}

- (void)objectDidFinishProcess:(id)object {
    
}

#pragma mark -
#pragma mark Private Methods
- (BNVisitor *)receiveVisitor {
    BNVisitor *visitor = [BNVisitor initWithCleanCar:NO];
    
    return visitor;
}

@end
