//
//  BNClient.h
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNPerson.h"

@interface BNClient : BNPerson

@property (nonatomic, assign) BOOL isClean;

+ (id)createClientWithCleanCar:(BOOL)isClean withMoney:(float)money;

- (instancetype)initClientWithCleanCar:(BOOL)isClean withMoney:(float)money;

@end
