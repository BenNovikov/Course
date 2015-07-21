//
//  BNAccountant.m
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNAccountant.h"

@implementation BNAccountant

#pragma mark -
#pragma mark Public Methods

- (void)countMoney {
    NSLog(@"%@ is counting money. There is $%8.02f now", self, self.money);
}

- (void)performStaffSpecificOperation:(BNRoom *)location {
    [self countMoney];
}

@end
