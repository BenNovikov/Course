//
//  BNClient.m
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNClient.h"

static uint64_t const kBNClientInitialMoney = 10000;

@implementation BNClient

#pragma mark -
#pragma mark Class Methods

+ (id)createClientWithCleanCar:(BOOL)Clean withMoney:(float)money {
    return [[[self alloc] initClientWithCleanCar:(BOOL)Clean withMoney:(float)money] autorelease];
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

    if(self){
        [self setClean:NO];
        [self setMoney:money];
    }
    
    return self;
}

@end
