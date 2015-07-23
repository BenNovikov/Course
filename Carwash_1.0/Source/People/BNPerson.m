//
//  BNPerson.m
//  SummerCourse
//
//  Created by Admin on 157/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNPerson.h"

@implementation BNPerson
//@synthesize currentLocation;

#pragma mark -
#pragma mark Class Methods

+ (id)createWith:(float)money {
    return [[[self alloc] initWith:(float)money] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    
    return [BNPerson createWith:0.0];
}

- (instancetype)initWith:(float)money {
    self = [super init];
    
    if(self){
        self.money  = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (float)giveMoney:(float)amount {
    if (nil != self && 0 < amount) {
        float hasMoney = self.money;
        if (hasMoney > 0) {
            if (hasMoney < amount) {
                amount = hasMoney;
                self.money = 0;
            } else {
                self.money -= amount;
            }
            
            return amount;
        }
    }
    
    return 0;
}

- (void)receiveMoney:(float)amount {
    if (nil != self && 0 != amount) {
        self.money += amount;
    }
}

@end
