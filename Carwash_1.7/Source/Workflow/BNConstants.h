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
NS_STRING_KEY(kBNWillReceive, @"%@ will receive money from %@");
NS_STRING_KEY(kBNFinishedMoney, @"%@ finished with %f money on the pocket");
NS_STRING_KEY(kBNReceivedMoney, @"%@ received %f from %@");
NS_STRING_KEY(kBNWith, @"%@ with %@");

#define NS_INT_KEY(key, value) static int const key = value
NS_INT_KEY(kBNNumberOfCashiers, 1);
NS_INT_KEY(kBNNumberOfWashers, 2);
NS_INT_KEY(kBNNumberOfCars, 50);

NS_INT_KEY(kBNDefaultVisitorsMoney, 100);
NS_INT_KEY(kBNWasherSalary, 50);
NS_INT_KEY(kBNCashierSalary, 100);
NS_INT_KEY(kBNBigBossSalary, 100);

#define NS_FLOAT_KEY(key, value) static float const key = value
NS_FLOAT_KEY(kBNServicePrice, 100.00);
NS_FLOAT_KEY(kBNSleepInterval, 1000);

#endif
