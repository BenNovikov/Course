//
//  BNFemaleCreature.m
//  Human
//
//  Created by Admin on 7/14/15.
//  Copyright © 2015 ___BasicNotation___. All rights reserved.
//
#import "BNMaleCreature.h"
#import "BNFemaleCreature.h"

//@class BNMaleCreature;

static NSString * const kBNBirthMessage         = @"%@ just gave birth to %@, weight:%.02f";
static NSString * const kBNNewbornName          = @"Newbie";
static uint64_t const kBNNumberOfClasses        = 2;
static uint64_t const kBNWeightLowerLimit       = 1;
static uint64_t const kBNWeightUpperLimit       = 5;
static uint64_t const kBNPostmenarchalAge       = 12;
static uint64_t const kBNPrecisionMultiplier    = 100;

@implementation BNFemaleCreature

#pragma mark -
#pragma mark Public Methods

- (void)giveForth {
    if (kBNPostmenarchalAge <= self.age) {
        Class creatureClass = (arc4random_uniform(kBNNumberOfClasses)%kBNNumberOfClasses
                               ? [BNMaleCreature class]
                               : [self class]);
        float weight = (float)arc4random_uniform(kBNPrecisionMultiplier * (kBNWeightUpperLimit - kBNWeightLowerLimit)) / kBNPrecisionMultiplier + kBNWeightLowerLimit;
        
        [self addChild:[creatureClass creatureWithName:kBNNewbornName withAge:0 withWeight:weight]];
        NSLog(kBNBirthMessage, self.name, creatureClass, weight);
    }
}

- (void)performGenderSpecificOperation {
    [super performGenderSpecificOperation];
    [self giveForth];
}

@end
