//
//  BNStaff.m
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNStaff.h"
#import "BNCarwash.h"

static uint64_t const kBNIniialSalary = 80;
static float const kBNIniialExperience = 0;

@implementation BNStaff

#pragma mark -
#pragma mark Class Methods

+ (id)createWithSalary:(uint64_t)salary experience:(float)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {

    return [BNStaff createWithSalary:kBNIniialSalary experience:kBNIniialExperience];
}

- (instancetype)initWithSalary:(uint64_t)salary experience:(float)experience {

    if(self){
        [self setSalary:salary];
        [self setExperience:experience];
        [self setMoney:0];
        [self setBusy:NO];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)performOperationHoursDuties:(BNCarwash *)object {
    
}

- (void)performAfterOperationHoursDuties:(BNCarwash *)object {
    
}

@end
