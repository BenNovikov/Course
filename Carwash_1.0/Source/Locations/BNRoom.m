//
//  BNRoom.m
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNRoom.h"
#import "BNPerson.h"

@interface BNRoom()

@property (nonatomic, retain) NSMutableArray *mutablePersons;

@end

@implementation BNRoom
@dynamic persons;

#pragma mark -
#pragma mark Class Methods

+ (id)createRoomOfType:(BNCarwashStructure)structure {
    return [[[self alloc] initWithType:structure persons:[NSArray array]] autorelease];
}

+ (id)createRoomOfType:(BNCarwashStructure)structure persons:(NSArray *)persons {
    return [[[self alloc] initWithType:structure persons:persons] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.mutablePersons = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithType:BNCarwashUndefined persons:nil];
}

- (instancetype)initWithType:(BNCarwashStructure)structure {
    self = [super init];
    
    if(self){
        self.structure = structure;
        self.mutablePersons = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithType:(BNCarwashStructure)structure persons:(NSArray *)persons {
    self = [super init];
    
    if(self){
        self.structure = structure;
        self.mutablePersons = [NSMutableArray arrayWithArray:persons];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSArray *)persons {
    
    return [[self.mutablePersons copy] autorelease];
}

- (void)addPerson:(BNPerson *)person {
    if(nil != person && NO == [self.mutablePersons containsObject:person]) {
        [self.mutablePersons addObject:person];
        person.currentLocation = self;
    }
}

- (void)removePerson:(BNPerson *)person {
    if(nil != person && YES == [self.mutablePersons containsObject:person]) {
        [self.mutablePersons removeObject:person];
        person.currentLocation = nil;
    }
}

@end
