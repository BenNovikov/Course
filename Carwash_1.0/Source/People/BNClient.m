//
//  BNClient.m
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNClient.h"

static uint64_t const kBNClientInitialMoney = 10000;

@implementation BNClient
//@synthesize isClean;

#pragma mark -
#pragma mark Class Methods

+ (id)createClientWithCleanCar:(BOOL)isClean withMoney:(float)money {
    return [[[self alloc] initClientWithCleanCar:(BOOL)isClean withMoney:(float)money] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init  {
    
    return [self initClientWithCleanCar:NO withMoney:kBNClientInitialMoney];
}

- (instancetype)initClientWithCleanCar:(BOOL)isClean withMoney:(float)money {
//    self = [super init];
    if(self){
        self.isClean    = NO;
        self.money      = money;
    }
    
    return self;
}

@end
