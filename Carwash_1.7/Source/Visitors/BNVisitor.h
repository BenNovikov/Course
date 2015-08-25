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

@interface BNVisitor : BNObservableObject<BNCashFlowProtocol>
//@property (nonatomic, assign) float                    money;
@property (nonatomic, assign, getter = isClean) BOOL    clean;

+ (id)initWithCleanCar:(BOOL)clean money:(float)money;
+ (id)initWithCleanCar:(BOOL)clean;

- (instancetype)initWithCleanCar:(BOOL)clean money:(float)money NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCleanCar:(BOOL)clean;

@end
