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

- (void)performSpecificOperationWithObject:(id)object {
    if (nil != object) {
//        @autoreleasepool {
        NSLog(@"%@ started with %@ car", self, object);
            @synchronized(self) {

                [super performSpecificOperationWithObject:object];
            }
//        }
    }
}
//
//- (void)startTaskWithObject:(id<BNStateProtocol>)object {
////    self.processedObject = (BNVisitor *)object;
////    object.state = kBNObjectStateIsBusy;
//    [super startTaskWithObject:object];
//}
//
//- (void)finishTask {
////    BNVisitor *visitor = self.processedObject;
////    visitor.state = kBNObjectStateFinishedProcess;
//    [super finishTask];
////    NSLog(@"%@ finished with %f money on the pocket", self, self.money);
//}

@end
