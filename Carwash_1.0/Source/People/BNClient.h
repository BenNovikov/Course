//
//  BNClient.h
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNPerson.h"

@interface BNClient : BNPerson

@property (nonatomic, assign, getter = isClean) BOOL Clean;

+ (id)createClientWithCleanCar:(BOOL)Clean withMoney:(float)money;

- (instancetype)initClientWithCleanCar:(BOOL)Clean withMoney:(float)money;

@end
