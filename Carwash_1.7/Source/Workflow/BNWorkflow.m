//
//  BNWorkflow.m
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNWorkflow.h"
#import "BNConstants.h"

@implementation BNWorkflow

#pragma mark -
#pragma mark Class Methods
+ (NSArray *)labelNames {
    static NSArray *names;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        names = [[[NSArray alloc] initWithObjects:kBNActorsPosition count:kBNHierarchyLevels] autorelease];
    });
    
    return names;
}

+ (BNWorkflow *)createWithBoss:(BNActor *)boss
                   accountants:(NSArray *)accountants
                       washers:(NSArray *)washers
{
    return [[[self alloc] initWithBoss:(BNActor *)boss
                           accountants:(NSArray *)accountants
                               washers:(NSArray *)washers]
            autorelease];}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    
    [super dealloc];
}

- (BNWorkflow *)initWithBoss:(BNActor *)boss
                 accountants:(NSArray *)accountants
                     washers:(NSArray *)washers
{
    if (self = [super init]) {

//    [self generateVisitors:kBNActorsNumber[0]
//        withDelayInSeconds:kBNActorsGenerationDelayLowerBound[0]
//                        to:kBNActorsGenerationDelayUpperBound[0]];
    };
    
    return self;
}

#pragma mark -
#pragma mark Public
- (void)runCarwash {
    
}

// [Name of associated class] + [Did | Will] + [UniquePartOfName] + Notification
// [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:notificationSender];

- (void)generateVisitors:(NSUInteger)number
      withDelayInSeconds:(double)lowerBound
                      to:(double)upperBound
{
    if (0 != number && lowerBound > 0 && upperBound > 0) {
        for (NSUInteger counter = 0; counter < number; counter++) {
            // Do something
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:@"BNBackgroundOperationDidGenerateVisitorNotification"
                 object:self];
            });
        }
    }
}

- (BNActor *)newVisitor {
    
    return nil;
}

@end
