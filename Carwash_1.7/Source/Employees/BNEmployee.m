//
//  BNEmployee.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEmployee.h"

@interface BNEmployee ()

- (SEL)selectorForState:(BNObjectState)state;

@end

@implementation BNEmployee

#pragma mark -
#pragma mark Class

+ (id)hireWithSalary:(unsigned int)salary {
    return [[[self alloc] initWithSalary:salary] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.processedObject = nil;
    
    [super dealloc];
}

- (instancetype)initWithSalary:(unsigned int)salary {    
    self = [super init];
    if (self) {
        self.salary = salary;
        self.state = kBNObjectStateIsFree;
    };
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(BNObjectState)state {
    BNObjectState currentState = self.state;
    
    if (currentState != state) {
        @synchronized(self) {
            if (currentState != state) {
                _state = state;
                
                [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)performProcessWithObject:(id)object {    
    [self startTaskWithObject:object];
    [self performSelectorInBackground:@selector(performSpecificOperationWithObject:) withObject:object];
}

- (void)startTaskWithObject:(id)object {
    self.state = kBNObjectStateIsBusy;
    self.processedObject = object;
}

- (void)performSpecificOperationWithObject:(id)object {
    usleep(arc4random_uniform(kBNSleepInterval));
    [self finishTask];
}

- (void)finishTask {
    self.processedObject = nil;
    self.state = kBNObjectStateFinishedProcess;
}

- (void)mayBeFree {
    self.state = kBNObjectStateIsFree;
}

#pragma mark -
#pragma mark <BNCashFlowProtocol>

- (void)receiveMoney:(float)money fromPayer:(id<BNCashFlowProtocol>)payer {
    if ([payer isAbleToPayMoney:money]) {
        payer.money -= money;
        self.money += money;
    }
}

- (BOOL)isAbleToPayMoney:(float)money {
    return self.money >= money;
}

#pragma mark -
#pragma mark <BNStateProtocol>

- (void)objectDidBecomeFree:(id)object {
//    NSLog(kBNLogBecomeFree, [self class], self, self.processedObject, self.money);
}

- (void)objectDidBecomeBusy:(id)object {
//    NSLog(kBNLogBecomeBusy, [self class], self, self.processedObject, self.money);
}

- (void)objectDidFinishProcess:(id)object {
//    NSLog(kBNLogFinishProcess, [self class], self, self.processedObject, self.money);
    [self performProcessWithObject:object];
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(BNObjectState)state {
    NSDictionary *dictionary = kBNStateSelectors;
    
    return NSSelectorFromString(dictionary[@(state)]);
}

@end
