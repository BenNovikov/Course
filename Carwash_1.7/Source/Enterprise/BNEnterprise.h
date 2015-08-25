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

@class BNDirector;
@class BNVisitor;

@interface BNEnterprise : NSObject<BNStateProtocol>
@property (nonatomic, assign) BNDirector        *director;
@property (nonatomic, assign) NSMutableArray    *cashiers;
@property (nonatomic, assign) NSMutableArray    *washers;

+ (id)createWithDirector:(BNDirector *)director
                cashiers:(NSArray *)cashiers
                 washers:(NSArray *)washers;

- (instancetype)initWithDirector:(BNDirector *)director
                        cashiers:(NSArray *)cashiers
                         washers:(NSArray *)washers NS_DESIGNATED_INITIALIZER;

- (void)runWithNumberOfCars:(NSUInteger)numberOfCars
                        price:(NSUInteger)price;

@end
