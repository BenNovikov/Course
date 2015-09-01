//
//  BNDispatcher.h
//  Course
//
//  Created by Admin on 15/09/01/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNDispatcher : NSObject

+ (BNDispatcher *)createWithQueue:(NSArray *)queue handlers:(NSArray *)handlers;

- (instancetype)initWithQueue:(NSArray *)queue handlers:(NSArray *)handlers NS_DESIGNATED_INITIALIZER;

- (void)enqueueObject:(id)object;
- (void)dequeueObject:(id)object;
- (void)processObject:(id)object;

@end
