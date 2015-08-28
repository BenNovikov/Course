//
//  BNEmployee.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNObservableObject.h"

#import "BNCashFlowProtocol.h"
#import "BNStateProtocol.h"
#import "BNConstants.h"

@interface BNEmployee : BNObservableObject<BNCashFlowProtocol>

@property (nonatomic, assign)   unsigned int    salary;
@property (nonatomic, assign)   float           money;
@property (nonatomic, retain)   id              processedObject;


+ (id)hireWithSalary:(unsigned int)salary;

- (instancetype)initWithSalary:(unsigned int)salary NS_DESIGNATED_INITIALIZER;

- (void)setState:(BNObjectState)state;

- (void)performProcessWithObject:(id)object;
- (void)startTaskWithObject:(id<BNStateProtocol>)object;
- (void)performSpecificOperationWithObject:(id)object;
- (void)finishTask;
- (void)mayBeFree;

@end
