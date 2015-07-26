//
//  BNBuilding.m
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNBuilding.h"

@interface BNBuilding()
@property (nonatomic, retain) NSMutableArray *mutableBays;

@end

@implementation BNBuilding
@dynamic bays;

#pragma mark -
#pragma mark Class Methods

+ (id)createWithOffice:(BNRoom *)currentOffice withBays:(NSArray *)bays {
    
    return [[[self alloc] initWithOffice:(BNRoom *)currentOffice withBays:(NSArray *)bays] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.office = nil;
    self.mutableBays = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithOffice:nil withBays:nil];
}

- (instancetype)initWithOffice:(BNRoom *)currentOffice withBays:(NSArray *)bays {
    self = [super init];
    
    if(self){
        self.office = currentOffice;
        self.mutableBays = [NSMutableArray arrayWithArray:bays];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSArray *)bays {
    
    return [[self.mutableBays copy] autorelease];
}

- (void)addBay:(BNRoom *)bay {
    if(nil != bay && NO == [self.mutableBays containsObject:bay]) {
        [self.mutableBays addObject:bay];
    }
}

- (void)removeBay:(BNRoom *)bay {
    if(nil != bay && YES == [self.mutableBays containsObject:bay]) {
        [self.mutableBays removeObject:bay];
    }
}

@end
