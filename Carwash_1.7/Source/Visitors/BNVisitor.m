//
//  BNVisitor.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNVisitor.h"

static uint64_t const kBNVisitorInitialMoney = 10000;

@implementation BNVisitor

#pragma mark -
#pragma mark Class Methods

+ (id)visitorWithCleanCar:(BOOL)clean money:(float)money {
    return [[[self alloc] initWithCleanCar:(BOOL)clean money:(float)money] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {

    [super dealloc];
}

- (instancetype)init  {
    return [self initWithCleanCar:NO money:kBNVisitorInitialMoney];
}

- (instancetype)initWithCleanCar:(BOOL)isClean money:(float)money {
    self = [super init];
    if(self){
        [self setClean:NO];
        [self setMoney:money];
    }
    
    return self;
}

@end
