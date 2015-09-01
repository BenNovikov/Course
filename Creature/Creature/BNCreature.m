//
//  BNCreature.m
//  Course
//
//  Created by BenNovikov on 7/7/15.
//  Copyright (c) 2015 ___BasicNotation___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNCreature.h"

//static NSString * const kBNDescriptionFormat = @"%@\n name:%@, age:%ld, weight:%.02f";
static NSString * const kBNPhraseToSay = @"%@ says: \"%@\"";
static NSString * const kBNCryingBabySays = @"Waa! Waa!";
static uint64_t const kBNAgeToStartSpeaking = 2;

@interface BNCreature()
@property (nonatomic, retain) NSMutableArray *mutableChildren;
@end

@implementation BNCreature

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (id)creatureWithName:(NSString *)name withAge:(NSUInteger)age withWeight:(float)weight {
    return [[[self alloc] initWithName:name withAge:age withWeight:weight] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithName:nil withAge:0 withWeight:0];
}

- (instancetype)initWithName:(NSString *)name withAge:(NSUInteger)age withWeight:(float)weight {
    self = [super init];

    if(self){
        self.name   = name;
        self.age    = age;
        self.weight = weight;
        self.mutableChildren = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

//- (NSString *)description {
//    return [NSString stringWithFormat:kBNDescriptionFormat, [[super description] autorelease], self.name, self.age, self.weight];
//}

- (void)addChild:(BNCreature *)child {
//    @synchronized(self.mutableChildren){
        if(nil != child && NO == [_mutableChildren containsObject:child]) {
            [_mutableChildren addObject:child];
        }
//    }
}

- (void)removeChild:(BNCreature *)child {
//    @synchronized(self.mutableChildren){
        if(nil != child && YES == [_mutableChildren containsObject:child]) {
            [self.mutableChildren removeObject:child];
        }
//    }
}

- (void)sayPhrase:(NSString *)phrase {
    if (kBNAgeToStartSpeaking <= self.age) {
        NSLog(kBNPhraseToSay, self.name, phrase);
    } else {
        NSLog(kBNPhraseToSay, self.name, kBNCryingBabySays);
    }    
    
    for (BNCreature *creature in self.mutableChildren) {
        [creature sayPhrase:phrase];
    }
    
//    [self.children makeObjectsPerformSelector:_cmd];
}

- (void)performGenderSpecificOperation {
    
}

@end
