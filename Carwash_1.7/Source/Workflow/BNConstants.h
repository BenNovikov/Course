//
//  BNConstants.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef Course_BNConstants_h
#define Course_BNConstants_h

//static uint64_t const kBNHierarchyLevels            = 4;
//NSString * const kBNActorsPosition[]                = {@"Visitor", @"Washer", @"Accountant", @"Boss"};
//NSUInteger const kBNActorsNumber[]                  = {100, 10, 1, 1};
//
//BOOL const kBNActorsConstant[]                      = {NO, YES, YES, YES};
//NSUInteger const kBNActorsMoney[]                   = {100, 0, 0, 0};
//NSUInteger const kBNActorsExperienceLowerBound[]    = {0, 0, 2, 5};
//NSUInteger const kBNActorsExperienceUpperBound[]    = {5, 5, 10, 20};
//NSUInteger const kBNActorsRewardLowerBound[]        = {5, 50, 70, 120};
//NSUInteger const kBNActorsRewardUpperBound[]        = {10, 70, 100, 150};
//
//double const kBNActorsGenerationDelayLowerBound[]   = {.5, 0, 0, 0};
//double const kBNActorsGenerationDelayUpperBound[]   = {1.0, 0, 0, 0};

typedef NS_ENUM(NSUInteger, BNObjectState) {
    kBNObjectStateIsFree,
    kBNObjectStateIsBusy,
    kBNObjectStateFinishedProcess
};

#define kBNStateSelectors @{@(kBNObjectStateIsFree) : NSStringFromSelector(@selector(objectDidBecomeFree:)), \
                            @(kBNObjectStateIsBusy) : NSStringFromSelector(@selector(objectDidBecomeBusy:)), \
                            @(kBNObjectStateFinishedProcess) : NSStringFromSelector(@selector(objectDidFinishProcess:))}

#define NS_STRING_KEY(key, value) static NSString *const key = value
NS_STRING_KEY(kBNErrorNoParameter, @"Parameter must not be null!");
NS_STRING_KEY(kBNErrorReadJSON, @"An error reading JSON");
NS_STRING_KEY(kBNErrorConvertToString, @"An error converting to string");
NS_STRING_KEY(kBNErrorConvertToDictionary, @"An error converting to dictionary");

#define NS_INT_KEY(key, value) static int const key = value
NS_INT_KEY(kBNNumberOfCashiers, 1);
NS_INT_KEY(kBNNumberOfWashers, 10);
NS_INT_KEY(kBNNumberOfCars, 1000);
NS_INT_KEY(kBNDefaultVisitorsMoney, 100);

#define NS_FLOAT_KEY(key, value) static float const key = value
NS_FLOAT_KEY(kBNServicePrice, 20.00);
NS_FLOAT_KEY(kBNSleepInterval, 0.01);

#endif
