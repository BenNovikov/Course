//
//  BNPerson.h
//  Course
//
//  Created by Admin on 157/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRoom.h"

@interface BNPerson : NSObject

@property (nonatomic, assign)   float   money;
@property (nonatomic, assign)   BNRoom  *currentLocation;

+ (id)createWith:(float)money;

- (instancetype)init;
- (instancetype)initWith:(float)money;

- (float)giveMoney:(float)amount;
- (void)receiveMoney:(float)amount;

@end
