//
//  BNEmployee.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEmployee.h"

//#define kIDPStateSelectors  @{@(kIDPBucketStateEmpty)   : NSStringFromSelector(@selector(bucketBecomeEmpty:)), \
//                            @(kIDPBucketStateNotEmpty)  : NSStringFromSelector(@selector(bucketContentHasChanged:)), \
//                            @(kIDPBucketStateFull)      : NSStringFromSelector(@selector(bucketBecomeFull:))}

//@interface BNEmployee ()
//@property (nonatomic, assign)   BNEmployeeState  state;
//
//@end

@implementation BNEmployee
+ (id)hireWithSalary:(unsigned int)salary {
    return [[[self alloc] initWithSalary:salary] autorelease];
}

- (instancetype)initWithSalary:(unsigned int)salary {
    
    if (self = [super init]) {
        self.salary = salary;
    };
    
    return self;
}

- (SEL)selectorForState:(BNEmployeeState)state {
    
    return nil;
}

@end
