//
//  BNStaff.h
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNPerson.h"
@class BNCarwash;

@interface BNStaff : BNPerson
@property (nonatomic, assign)                   uint64_t    salary;
@property (nonatomic, assign)                   float       experience;
@property (nonatomic, assign, getter = isBusy)  BOOL        busy;

+ (id)createWithSalary:(uint64_t)salary experience:(float)experience;

- (instancetype)init;
- (instancetype)initWithSalary:(uint64_t)salary experience:(float)experience;

- (void)performOperationHoursDuties:(BNCarwash *)object;
- (void)performAfterOperationHoursDuties:(BNCarwash *)object;

@end
