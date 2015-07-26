//
//  BNStaffBoss.m
//  Course
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNBoss.h"

static NSString const *kBNBossMessageProfit = @"%@ received some money... Profit! $%8.02f";
static NSString const *kBNBossMessageLoss = @"%@ received nothing... Losses fixed today!";

@implementation BNBoss

#pragma mark -
#pragma mark Public Methods

- (void)receiveProfit {
    float moneyReceived = [self money];
    if (0 < moneyReceived) {
        NSLog(kBNBossMessageProfit, self, moneyReceived);
    } else {
        NSLog(kBNBossMessageLoss, self);
    }
}

- (void)performAfterOperationHoursDuties:(BNCarwash *)object {
    [self receiveProfit];
    [self.currentLocation removePerson:self];
}



@end
