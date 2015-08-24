//
//  BNConstants.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef Course_BNConstants_h
#define Course_BNConstants_h

static uint64_t const kBNHierarchyLevels            = 4;
NSString * const kBNActorsPosition[]                = {@"Visitor", @"Washer", @"Accountant", @"Boss"};
NSUInteger const kBNActorsNumber[]                  = {100, 10, 1, 1};

BOOL const kBNActorsConstant[]                      = {NO, YES, YES, YES};
NSUInteger const kBNActorsMoney[]                   = {100, 0, 0, 0};
NSUInteger const kBNActorsExperienceLowerBound[]    = {0, 0, 2, 5};
NSUInteger const kBNActorsExperienceUpperBound[]    = {5, 5, 10, 20};
NSUInteger const kBNActorsRewardLowerBound[]        = {5, 50, 70, 120};
NSUInteger const kBNActorsRewardUpperBound[]        = {10, 70, 100, 150};

double const kBNActorsGenerationDelayLowerBound[]   = {.5, 0, 0, 0};
double const kBNActorsGenerationDelayUpperBound[]   = {1.0, 0, 0, 0};

#endif
