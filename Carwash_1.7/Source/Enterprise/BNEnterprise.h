//
//  BNEnterprise.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNStateProtocol.h"
#import "BNConstants.h"
#import "BNCashFlowProtocol.h"

@class BNBigBoss;
@class BNVisitor;

@interface BNEnterprise : NSObject<BNStateProtocol>
@property (nonatomic, assign) BNBigBoss         *bigBoss;
@property (nonatomic, assign) NSMutableArray    *cashiers;
@property (nonatomic, assign) NSMutableArray    *washers;
@property (nonatomic, retain) NSMutableArray    *visitorsQueue;

+ (BNEnterprise *)createWithBigBoss:(BNBigBoss *)bigBoss
                           cashiers:(NSArray *)cashiers
                            washers:(NSArray *)washers;

- (instancetype)initWithBigBoss:(BNBigBoss *)bigBoss
                        cashiers:(NSArray *)cashiers
                         washers:(NSArray *)washers NS_DESIGNATED_INITIALIZER;

- (void)runWithNumberOfCars:(NSUInteger)numberOfCars
                        price:(NSUInteger)price;

- (void)processObject:(id<BNCashFlowProtocol>)object;

@end
