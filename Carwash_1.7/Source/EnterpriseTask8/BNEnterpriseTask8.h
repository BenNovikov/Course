//
//  BNEnterpriseTask8.h
//  Course
//
//  Created by Admin on 15/09/01/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNStateProtocol.h"
#import "BNConstants.h"
#import "BNCashFlowProtocol.h"

@class BNBigBoss;
@class BNVisitor;

@interface BNEnterpriseTask8 : NSObject <BNStateProtocol>

+ (BNEnterpriseTask8 *)createWithBigBoss:(BNBigBoss *)bigBoss
                           cashiers:(NSArray *)cashiers
                            washers:(NSArray *)washers;

+ (BNEnterpriseTask8 *)createWithRandomCashiers:(NSUInteger)numberOfCashiers
                                  randomWashers:(NSUInteger)numberOfWashers;

- (instancetype)initWithBigBoss:(BNBigBoss *)bigBoss
                       cashiers:(NSArray *)cashiers
                        washers:(NSArray *)washers NS_DESIGNATED_INITIALIZER;

- (void)runWithNumberOfCars:(NSUInteger)numberOfCars;

@end
