//
//  BNBigBoss.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNBigBoss.h"

@implementation BNBigBoss

- (void)performSpecificOperationWithObject:(id)object {
    if (nil != object) {
        @synchronized(self) {
            NSLog(@"%@ counting money:%f", self, self.money);
            [super performSpecificOperationWithObject:object];
        }
    }
}

//- (void)startTaskWithObject:(id<BNStateProtocol>)object {
//    object.state = kBNObjectStateIsBusy;
//    [super startTaskWithObject:object];
//}
//
//- (void)finishTask {
//    BNEmployee *visitor = self.processedObject;
//    visitor.state = kBNObjectStateFinishedProcess;
//    [super finishTask];
//    NSLog(@"%@ finished with %f money on the pocket", self, self.money);
//}

@end
