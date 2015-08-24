//
//  BNEnterprise.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class BNEmployee;
@class BNDirector;
@class BNVisitor;

@interface BNEnterprise : NSObject
@property (nonatomic, assign) BNDirector        *director;
@property (nonatomic, assign) NSMutableArray    *cashiers;
@property (nonatomic, assign) NSMutableArray    *washers;

+ (id)createWithDirector:(BNDirector *)director
                cashiers:(NSArray *)cashiers
                 washers:(NSArray *)washers;

- (instancetype)initWithDirector:(BNDirector *)director
                        cashiers:(NSArray *)cashiers
                         washers:(NSArray *)washers;

- (BNVisitor *)receiveVisitor:(BNVisitor *)visitor;
- (void)startWorkflow;
- (void)finishWorkflow;

@end
