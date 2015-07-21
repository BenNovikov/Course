//
//  BNBuilding.h
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRoom.h"

@interface BNBuilding : NSObject
@property (nonatomic, retain) BNRoom *office;
@property (nonatomic, retain) BNRoom *bay;

+ (id)createWithOffice:(BNRoom *)office withBay:(BNRoom *)bay;

- (instancetype)init;

- (instancetype)initWithOffice:(BNRoom *)office withBay:(BNRoom *)bay;

@end
