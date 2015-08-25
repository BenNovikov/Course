//
//  BNWasher.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNWasher.h"
#import "BNVisitor.h"

@implementation BNWasher {
    BNVisitor *visitor;
}

- (void)performSpecificOperationWithObject:(id)object {
    if (nil != object) {
        @autoreleasepool {
            @synchronized(self) {
                NSLog(@"%@ started with %@ car", self, object);
                [self receiveMoney:[object price] fromPayer:object];
                [super performSpecificOperationWithObject:object];
            }
        }
    }
}

- (void)startTaskWithObject:(id<BNStateProtocol>)object {
    visitor = (BNVisitor *)object;
    object.state = kBNObjectStateIsBusy;
    [super startTaskWithObject:object];
}

- (void)finishTask {
    visitor.state = kBNObjectStateFinishedProcess;
    [super finishTask];
    NSLog(@"%@ finished, %f money on pocket", self, self.money);
}

@end
