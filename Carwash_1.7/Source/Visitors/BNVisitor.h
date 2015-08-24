//
//  BNVisitor.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNVisitor : NSObject
@property (nonatomic, assign) double                    money;
@property (nonatomic, assign, getter = isClean) BOOL    clean;

+ (id)visitorWithCleanCar:(BOOL)clean money:(float)money;

- (instancetype)initWithCleanCar:(BOOL)clean money:(float)money;

@end
