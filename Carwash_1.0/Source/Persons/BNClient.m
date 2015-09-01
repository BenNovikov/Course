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

+ (id)clientWithCar:(BOOL)Clean money:(float)money {
    return [[[self alloc] initClientWithCar:(BOOL)Clean money:(float)money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

//- (void)dealloc {
//    
//    [super dealloc];
//}

- (instancetype)init  {    
    return [self initClientWithCar:NO money:kBNClientInitialMoney];
}

- (instancetype)initClientWithCar:(BOOL)isClean money:(float)money {
//    self = [super init];
    if(self){
        [self setClean:NO];
        [self setMoney:money];
    }
    
    return self;
}

@end
