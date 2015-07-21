//
//  BNBuilding.m
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNBuilding.h"

@implementation BNBuilding
@synthesize office;
@synthesize bay;

#pragma mark -
#pragma mark Class Methods

+ (id)createWithOffice:(BNRoom *)currentOffice withBay:(BNRoom *)currentBay {
    
    return [[[self alloc] initWithOffice:(BNRoom *)currentOffice withBay:(BNRoom *)currentBay] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.office = nil;
    self.bay = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithOffice:nil withBay:nil];
}

- (instancetype)initWithOffice:(BNRoom *)currentOffice withBay:(BNRoom *)currentBay {
    self = [super init];
    
    if(self){
        self.office = currentOffice;
        self.bay    = currentBay;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods


#pragma mark -
#pragma mark Private Methods


@end
