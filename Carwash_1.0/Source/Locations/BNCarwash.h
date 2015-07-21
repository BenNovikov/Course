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

+ (id)createWithManager:(BNStaff *)manager
         withAccountant:(BNStaff *)accountant
          withCarwasher:(BNStaff *)carwasher;

- (instancetype)initWithManager:(BNStaff *)manager
                 withAccountant:(BNStaff *)accountant
                  withCarwasher:(BNStaff *)carwasher;

- (BOOL)washCarOf:(BNClient *)client;

- (void)closeDown;

@end
