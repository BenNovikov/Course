//
//  BNEmployee.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "BNObservableObject.h"
#import "BNEmployeeObserver.h"

typedef NS_ENUM(NSUInteger, BNEmployeeState) {
    kBNEmployeeIsReadyToWork,
    kBNEmployeeIsBusyWithClient,
    kBNEmployeeIsReadyToCashUp
};

@interface BNEmployee : NSObject

@property (nonatomic, assign)   unsigned int    salary;
@property (nonatomic, assign)   double          cash;
//@property (nonatomic, retain)   NSMutableSet    *mutableObserverSet;

+ (id)hireWithSalary:(unsigned int)salary;

- (instancetype)initWithSalary:(unsigned int)salary;

- (SEL)selectorForState:(BNEmployeeState)state;

@end
