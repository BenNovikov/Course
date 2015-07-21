//
//  BNStaff.h
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNPerson.h"
#import "BNRoom.h"

@interface BNStaff : BNPerson

@property (nonatomic, assign)   uint64_t            salary;
@property (nonatomic, assign)   float               experience;
@property (nonatomic, assign)   BOOL                isBusy;

+ (id)hireWithSalary:(uint64_t)salary withExperience:(float)experience;

- (instancetype)init;
- (instancetype)initWithSalary:(uint64_t)salary withExperience:(float)experience;

- (void)performStaffSpecificOperation:(BNRoom *)location;

@end
