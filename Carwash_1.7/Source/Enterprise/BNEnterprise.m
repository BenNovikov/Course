//
//  BNEnterprise.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNEnterprise.h"

//@interface BNEnterprise()
//@property (nonatomic, retain) NSMutableArray *mutableWashers;
//@end
@class BNDirector;
@class BNCashier;
@class BNWasher;
@class BNEmployee;

@interface BNEnterprise()


@end

@implementation BNEnterprise

#pragma mark -
#pragma mark Class Methods
+ (id)createWithDirector:(BNDirector *)director
                cashiers:(NSArray *)cashiers
                 washers:(NSArray *)washers
{
    return [[[self alloc] initWithDirector:(BNDirector *)director
                                  cashiers:(NSArray *)cashiers
                                   washers:(NSArray *)washers]
            autorelease];
}

#pragma mark -
#pragma mark Init and Declare
- (void)dealloc {
    self.director = nil;
    self.cashiers = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (instancetype)initWithDirector:(BNDirector *)director
                        cashiers:(NSArray *)cashiers
                         washers:(NSArray *)washers
{
    if (self = [super init]) {
        self.director   = director;
        self.cashiers   = [NSMutableArray arrayWithArray:cashiers];
        self.washers    = [NSMutableArray arrayWithArray:washers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods
- (BNVisitor *)receiveVisitor:(BNVisitor *)visitor {
    
    return visitor;
}

- (void)startWorkflow {
    
}

- (void)finishWorkflow {
    
}

@end
