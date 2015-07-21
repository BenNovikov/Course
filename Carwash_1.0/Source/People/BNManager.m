//
//  BNStaffManager.m
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNManager.h"

@implementation BNManager

#pragma mark -
#pragma mark Public Methods

- (void)receiveProfit {
    NSLog(@"%@ is receiving Profit! It's $%8.02f for the day", self, [self money]);
}

- (void)performStaffSpecificOperation:(BNRoom *)location {

    [self receiveProfit];

}

@end
