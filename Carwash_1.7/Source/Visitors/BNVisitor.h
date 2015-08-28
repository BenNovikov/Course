//
//  BNVisitor.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNObservableObject.h"
#import "BNCashFlowProtocol.h"
#import "BNConstants.h"

@interface BNVisitor : NSObject<BNCashFlowProtocol>
@property (nonatomic, assign) float                     money;
@property (nonatomic, assign, getter = isClean) BOOL    clean;

+ (BNVisitor *)createWithCleanCar:(BOOL)clean money:(float)money;
+ (BNVisitor *)createWithMoney:(float)money;

- (instancetype)initWithCleanCar:(BOOL)clean money:(float)money NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithMoney:(float)money;

@end
