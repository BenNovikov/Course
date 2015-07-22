//
//  BNCarwash.h
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNBuilding.h"
#import "BNRoom.h"
#import "BNStaff.h"
#import "BNClient.h"

@interface BNCarwash : NSObject

@property (nonatomic, retain)   BNBuilding *building;
@property (nonatomic, assign)   float price;

+ (id)createWithBoss:(BNStaff *)Boss
         withAccountant:(BNStaff *)accountant
          withCarwasher:(BNStaff *)carwasher;

- (instancetype)initWithBoss:(BNStaff *)Boss
                 withAccountant:(BNStaff *)accountant
                  withCarwasher:(BNStaff *)carwasher;

- (BOOL)washCarOf:(BNClient *)client;

- (void)closeDown;

@end
