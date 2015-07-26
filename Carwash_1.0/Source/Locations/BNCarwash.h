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
                withBoss:(BNBoss *)boss
          withAccountant:(BNAccountant *)accountant
          withCarwashers:(NSArray *)carwashers;

- (instancetype)initWithBuilding:(BNBuilding *)building;
- (instancetype)initWithBuilding:(BNBuilding *)building
                        withBoss:(BNBoss *)boss
                  withAccountant:(BNAccountant *)accountant
                  withCarwashers:(NSArray *)carwashers;

- (BOOL)washCarOf:(BNClient *)client;
- (void)closeDown;

@end
