//
//  BNDispatcher.m
//  Course
//
//  Created by Admin on 15/09/01/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNDispatcher.h"
@interface BNDispatcher()
@property (nonatomic, retain) NSMutableArray    *dispatcherQueue;
@property (nonatomic, retain) NSMutableArray    *dispatcherHandlers;

@end

@implementation BNDispatcher

#pragma mark -
#pragma mark Class

+ (BNDispatcher *)createWithQueue:(NSArray *)queue handlers:(NSArray *)handlers {
    return [[[self alloc] initWithQueue:queue handlers:handlers] autorelease];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [_dispatcherHandlers makeObjectsPerformSelector:@selector(removeObserver:) withObject:self];
    self.dispatcherQueue    = nil;
    self.dispatcherHandlers = nil;

    [super dealloc];
}

- (instancetype)init {
    return [self initWithQueue:[NSArray array] handlers:[NSArray array]];
}

- (instancetype)initWithQueue:(NSArray *)queue handlers:(NSArray *)handlers {
    self = [super init];
    if (self) {
        self.dispatcherQueue    = [NSMutableArray arrayWithArray:queue];
        self.dispatcherHandlers = [NSMutableArray arrayWithArray:handlers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id)object {
    
    //find free handler and run processing or enqueue:
    
    [self enqueueObject:object];
}

// move to private
- (void)enqueueObject:(id)object {
    if (object && ![_dispatcherQueue containsObject:object]) {
        [self.dispatcherQueue addObject:object];
    }
}

- (void)dequeueObject:(id)object {
    if (object && [_dispatcherQueue containsObject:object]) {
        [self.dispatcherQueue removeObject:object];
    }
}

#pragma mark -
#pragma mark <BNStateProtocol>

#pragma mark -
#pragma mark Private Methods

@end
