//
//  BNStaff.m
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNStaff.h"

static uint64_t const kBNIniialSalary = 80;
static float const kBNIniialExperience = 0;

@implementation BNStaff
@synthesize isBusy;

#pragma mark -
#pragma mark Class Methods

+ (id)hireWithSalary:(uint64_t)salary withExperience:(float)experience {
    return [[[self alloc] initWithSalary:salary withExperience:experience] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {

    return [BNStaff hireWithSalary:kBNIniialSalary withExperience:kBNIniialExperience];
}

- (instancetype)initWithSalary:(uint64_t)salary withExperience:(float)experience {
//    self = [super init];    
    if(self){
        self.salary     = salary;
        self.experience = experience;
        self.money      = 0;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)performStaffSpecificOperation:(BNRoom *)location {
    
}

@end
