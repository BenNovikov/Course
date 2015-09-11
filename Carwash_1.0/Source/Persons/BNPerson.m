//
//  BNPerson.m
//  Course
//
//  Created by Admin on 157/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNPerson.h"

@implementation BNPerson

#pragma mark -
#pragma mark Class Methods

+ (id)createWithMoney:(float)money {
    return [[[self alloc] initWith:(float)money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    
    return [BNPerson createWithMoney:0.0];
}

- (instancetype)initWith:(float)money {
    self = [super init];
    
    if(self){
        [self setMoney:money];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (float)giveMoney:(float)amount {
    if (nil != self && 0 < amount) {
        float cash = self.money;
        if (cash > 0) {
            if (cash < amount) {
                amount = cash;
                [self setMoney:0];
            } else {
                [self setMoney:self.money - amount];
            }
            
            return amount;
        }
    }
    
    return 0;
}

- (void)receiveMoney:(float)amount {
    if (nil != self && 0 != amount) {
        [self setMoney:self.money + amount];
    }
}

@end
