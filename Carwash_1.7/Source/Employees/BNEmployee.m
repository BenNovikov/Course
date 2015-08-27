//
//  BNEmployee.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEmployee.h"

//@interface BNEmployee()
//@end

@implementation BNEmployee

#pragma mark Class
+ (id)hireWithSalary:(unsigned int)salary {
    return [[[self alloc] initWithSalary:salary] autorelease];
}

#pragma mark -
#pragma mark Init and Declare
- (void)dealloc {
//    processedObject = nil;
    self.processedObject = nil;
    
    [super dealloc];
}

- (instancetype)initWithSalary:(unsigned int)salary {    
    if (self = [super init]) {
        self.salary = salary;
    };
    
    return self;
}

#pragma mark -
#pragma mark Accessors
- (void)setState:(BNObjectState)state {
    BNObjectState currentState = self.state;
    if (state != currentState) {
        @synchronized(self) {
            if (state != currentState) {
                super.state = state;
//                self.state = state;
            }
            [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
        }
    }
}

#pragma mark -
#pragma mark Public
- (void)performProcessWithObject:(id<BNStateProtocol>)object {
    [self startTaskWithObject:object];
    [self performSelectorInBackground:@selector(performSpecificOperationWithObject:) withObject:object];
//        [self performSelectorOnMainThread:@selector(finishTask) withObject:self waitUntilDone:NO];
}

- (void)startTaskWithObject:(id<BNStateProtocol>)object {
    if (nil != object) {
        @synchronized(object) {
            self.processedObject = object;
//            object.state = kBNObjectStateIsBusy;
        }
    }
}

- (void)performSpecificOperationWithObject:(id)object {
    usleep(arc4random_uniform(kBNSleepInterval));
    [self finishTask];
    
}

- (void)finishTask; {
    NSLog(@"Finishing");
    [self receiveMoney:kBNServicePrice fromPayer:self.processedObject];
    @synchronized(self) {
        self.state = kBNObjectStateFinishedProcess;
    }

    id<BNStateProtocol> object = self.processedObject;
    @synchronized(object) {
        object.state = kBNObjectStateIsFree;
        self.processedObject = nil;
    }
}

- (void)mayBeFree {
    @synchronized(self) {
        self.state = kBNObjectStateIsFree;
    }
}

#pragma mark -
#pragma mark <BNCashFlowProtocol>
- (void)receiveMoney:(float)money fromPayer:(id<BNCashFlowProtocol>)payer {
    if (nil != payer && money > 0 && payer.money >= money) {
        @synchronized(payer) {
            payer.money -= money;
            self.money += money;
        }
    }
}

#pragma mark -
#pragma mark <BNStateProtocol>
- (SEL)selectorForState:(BNObjectState)state {
    NSDictionary *dictionary = kBNStateSelectors;
    
    return NSSelectorFromString(dictionary[@(state)]);
}


@end
