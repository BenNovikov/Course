//
//  BNConstants.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef Course_BNConstants_h
#define Course_BNConstants_h

typedef NS_ENUM(NSUInteger, BNObjectState) {
    kBNObjectStateIsFree,
    kBNObjectStateIsBusy,
    kBNObjectStateFinishedProcess
};

#define kBNStateSelectors @{@(kBNObjectStateIsFree) : NSStringFromSelector(@selector(objectDidBecomeFree:)), \
                            @(kBNObjectStateIsBusy) : NSStringFromSelector(@selector(objectDidBecomeBusy:)), \
                            @(kBNObjectStateFinishedProcess) : NSStringFromSelector(@selector(objectDidFinishProcess:))}

#define NS_STRING_KEY(key, value) static NSString *const key = value
NS_STRING_KEY(kBNLogBecomeFree,             @" + %@ %@ Did Become Free with %@, %5.0f");
NS_STRING_KEY(kBNLogBecomeBusy,             @" - %@ %@ Did Become Busy with %@, %5.0f");
NS_STRING_KEY(kBNLogFinishProcess,          @" = %@ %@ Did Finish Proc with %@, %5.0f");
NS_STRING_KEY(kBNLogWasherStartedWithCar,   @"   %@  started washing car of %@");
NS_STRING_KEY(kBNLogBossMakesProfit,        @"   %@ makes profit: %5.2f");
NS_STRING_KEY(kBNLogCashierCountsMoney,     @"   %@ counts money: %5.2f");

#define NS_INT_KEY(key, value) static int const key = value
NS_INT_KEY(kBNNumberOfCashiers,     1);
NS_INT_KEY(kBNNumberOfWashers,      50);
NS_INT_KEY(kBNNumberOfCars,         500);

NS_INT_KEY(kBNDefaultVisitorsMoney, 100);
NS_INT_KEY(kBNWasherSalary,         50);
NS_INT_KEY(kBNCashierSalary,        100);
NS_INT_KEY(kBNBigBossSalary,        100);

#define NS_FLOAT_KEY(key, value) static float const key = value
NS_FLOAT_KEY(kBNServicePrice,       100.00);
NS_FLOAT_KEY(kBNSleepInterval,      3000);

#endif
