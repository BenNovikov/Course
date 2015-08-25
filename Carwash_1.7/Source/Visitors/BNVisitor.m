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
//@synthesize money;

#pragma mark -
#pragma mark Class Methods

+ (id)initWithCleanCar:(BOOL)clean money:(float)money {
    return [[[self alloc] initWithCleanCar:(BOOL)clean money:(float)money] autorelease];
}

+ (id)initWithCleanCar:(BOOL)clean {
    return [[[self alloc] initWithCleanCar:(BOOL)clean] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {

    [super dealloc];
}

- (instancetype)initWithCleanCar:(BOOL)clean {
    return [self initWithCleanCar:NO money:kBNVisitorInitialMoney];
}

- (instancetype)initWithCleanCar:(BOOL)clean money:(float)money {
    self = [super init];
    if(self){
        self.clean = NO;
        self.money = money;
    }
    
    return self;
}

@end
