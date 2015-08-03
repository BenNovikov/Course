//
//  BNCarwash.h
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNBuilding.h"
#import "BNRoom.h"
#import "BNClient.h"
#import "BNAccountant.h"
#import "BNCarwasher.h"
#import "BNBoss.h"

@interface BNCarwash : NSObject

@property (nonatomic, retain)   BNBuilding  *building;
@property (nonatomic, assign)   float       price;
@property (nonatomic, assign)   NSUInteger  nextBay;

+ (id)createWithBuilding:(BNBuilding *)building;
+ (id)createWithBuilding:(BNBuilding *)building
                    boss:(BNBoss *)boss
              accountant:(BNAccountant *)accountant
              carwashers:(NSArray *)carwashers;

- (instancetype)initWithBuilding:(BNBuilding *)building;
- (instancetype)initWithBuilding:(BNBuilding *)building
                            boss:(BNBoss *)boss
                      accountant:(BNAccountant *)accountant
                      carwashers:(NSArray *)carwashers;

- (BOOL)washCarOf:(BNClient *)client;
- (void)closeDown;

@end
