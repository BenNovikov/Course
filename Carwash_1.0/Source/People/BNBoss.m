//
//  BNStaffBoss.m
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNBoss.h"

@implementation BNBoss

#pragma mark -
#pragma mark Public Methods

- (void)receiveProfit {
    float moneyReceived = [self money];
    if (0 < moneyReceived) {
        NSLog(@"%@ is receiving money... Profit! $%8.02f", self, moneyReceived);
    } else {
        NSLog(@"%@ received nothing... Losses fixed today!", self);
    }
    
}

- (void)performStaffSpecificOperation:(BNRoom *)location {

    [self receiveProfit];

}

@end
