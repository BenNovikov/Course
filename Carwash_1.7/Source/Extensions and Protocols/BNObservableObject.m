//
//  BNObservableObject.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNObservableObject.h"

@implementation BNObservableObject {
    
    NSHashTable *observers;
}

#pragma mark -
#pragma mark Init and Declare
- (id)init {
    if (self = [super init]) {
        observers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

- (void)dealloc {
    observers = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public
- (void)addObserver:(id)observer {
    if (nil != observer) {
        @synchronized(observers) {
            [observers addObject:observer];
        }
    }
}

- (void)removeObserver:(id)observer {
    if (nil != observer) {
        @synchronized(observers) {
            [observers removeObject:observer];
        }
    }
}

- (BOOL)isObserver:(id)observer {
    if (nil != observer) {
        return [observers containsObject:observer];
    }
    
    return NO;
}

- (void)notifyObserversWithSelector:(SEL)selector {
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelectorOnMainThread:selector withObject:self waitUntilDone:NO];
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelectorOnMainThread:selector withObject:object waitUntilDone:NO];
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
