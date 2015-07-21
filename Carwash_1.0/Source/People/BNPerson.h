//
//  BNPerson.h
//  SummerCourse
//
//  Created by Admin on 157/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNPerson : NSObject

@property (nonatomic, assign)   float   money;

+ (id)createWith:(float)money;

- (instancetype)init;
- (instancetype)initWith:(float)money;

- (float)giveMoney:(float)amount;
- (void)receiveMoney:(float)amount;


@end
