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

@implementation BNEmployee {
    id<BNStateProtocol> retainedObject;

}
//@synthesize money;

#pragma mark -
#pragma mark Class
+ (id)hireWithSalary:(unsigned int)salary {
    return [[[self alloc] initWithSalary:salary] autorelease];
}

#pragma mark -
#pragma mark Init and Declare
- (void)dealloc {
    retainedObject = nil;
    
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
                self.state = state;
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
}

- (void)performSpecificOperationWithObject:(id)object {
    sleep(arc4random_uniform(kBNSleepInterval));
    [self finishTask];
}

- (void)startTaskWithObject:(id<BNStateProtocol>)object {
    if (nil != object) {
        @synchronized(self) {
            self.state = kBNObjectStateIsBusy;
        }
        @synchronized(object) {
            retainedObject = object;
            [retainedObject retain];
            retainedObject.state = kBNObjectStateIsBusy;
        }
    }
}

- (void)finishTask; {
    @synchronized(self) {
        self.state = kBNObjectStateFinishedProcess;
    }
    @synchronized(retainedObject) {
        retainedObject.state = kBNObjectStateFinishedProcess;
        [retainedObject release];
        retainedObject = nil;
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
