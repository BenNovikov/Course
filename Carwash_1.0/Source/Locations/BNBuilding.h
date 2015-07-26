//
//  BNBuilding.h
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRoom.h"

@interface BNBuilding : NSObject
@property (nonatomic, retain)   BNRoom  *office;
@property (nonatomic, readonly) NSArray *bays;

+ (id)createWithOffice:(BNRoom *)office withBays:(NSArray *)bays;

- (instancetype)init;
- (instancetype)initWithOffice:(BNRoom *)office withBays:(NSArray *)bays;

- (NSArray *)bays;

- (void)addBay:(BNRoom *)bay;
- (void)removeBay:(BNRoom *)bay;

@end
