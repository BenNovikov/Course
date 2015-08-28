//
//  BNCashier.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNCashier.h"

@implementation BNCashier

- (void)performSpecificOperationWithObject:(id)object {
    @autoreleasepool {
        @synchronized(self) {
            [self receiveMoney:kBNServicePrice fromPayer:object];
            
            NSLog(kBNLogCashierCountsMoney, self, self.money);
            [object mayBeFree];
            [self mayBeFree];
            
            [super performSpecificOperationWithObject:object];
        }
    }
}

@end
