//
//  BNWasher.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNWasher.h"
#import "BNVisitor.h"

@implementation BNWasher

- (void)performSpecificOperationWithObject:(BNVisitor *)object {
    @autoreleasepool {
        @synchronized(self) {
            [self receiveMoney:kBNServicePrice fromPayer:object];
            
            NSLog(kBNLogWasherStartedWithCar, self, object);
            object.clean = YES;
            
            [super performSpecificOperationWithObject:object];
        }
    }
}

@end
