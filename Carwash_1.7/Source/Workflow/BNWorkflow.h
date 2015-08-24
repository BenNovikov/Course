//
//  BNWorkflow.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNActor.h"
#import "BNConstants.h"


@interface BNWorkflow : NSObject

+ (NSDictionary *)actorsData;

+ (NSArray *)labelNames;

- (void)controllerToStopIn:(NSDate*)seconds
                    actors:(NSArray*)actorsArray;

- (void)generateVisitorsInBackground:(unsigned int)number
                  withDelayInSeconds:(unsigned int)lowerBound
                                  to:(unsigned int)upperBound;

- (BNActor*)generateVisitor;

@end
