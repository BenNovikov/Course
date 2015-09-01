//
//  BNCashFlowProtocol.h
//  Course
//
//  Created by Admin on 15/08/25/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNConstants.h"

@protocol BNCashFlowProtocol <NSObject>

@required
@property (nonatomic, assign) float money;

- (BOOL)isAbleToPayMoney:(float)money;

@optional
@property (nonatomic, assign) float price;

- (void)receiveMoney:(float)money fromPayer:(id<BNCashFlowProtocol>)payer;

@end