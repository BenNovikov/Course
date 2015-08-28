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
    if (nil != object) {
        @synchronized(self) {
            NSLog(@"%@ counting money:%f", self, self.money);
            [super performSpecificOperationWithObject:object];
        }
    }
}

//- (void)startTaskWithObject:(id<BNStateProtocol>)object {
//        object.state = kBNObjectStateIsBusy;
//    [super startTaskWithObject:object];
//}

//- (void)finishTask {
//
//    [super finishTask];
//
//}

@end
