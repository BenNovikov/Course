//
//  BNWorkflow.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNActor.h"

@interface BNWorkflow : NSObject

+ (NSArray *)labelNames;

+ (BNWorkflow *)createWithBoss:(BNActor *)boss
                   accountants:(NSArray *)accountants
                       washers:(NSArray *)washers;

- (BNWorkflow *)initWithBoss:(BNActor *)boss
                 accountants:(NSArray *)accountants
                     washers:(NSArray *)washers;

- (void)runCarwash;

- (void)generateVisitors:(NSUInteger)number
      withDelayInSeconds:(double)lowerBound
                      to:(double)upperBound;

- (BNActor *)newVisitor;

@end
