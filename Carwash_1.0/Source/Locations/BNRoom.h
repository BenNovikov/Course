//
//  BNRoom.h
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNPerson;

typedef NS_ENUM(NSUInteger, BNCarwashStructure) {
    BNCarwashUndefined,
    BNCarwashBay,
    BNCarwashOffice
};

@interface BNRoom : NSObject

@property (nonatomic, assign)   BNCarwashStructure  structure;
@property (nonatomic, readonly) NSArray *persons;

+ (id)createRoomOfType:(BNCarwashStructure)structure;
+ (id)createRoomOfType:(BNCarwashStructure)structure withPersons:(NSArray *)persons;

- (instancetype)init;
- (instancetype)initWithType:(BNCarwashStructure)structure withPersons:(NSArray *)persons;

- (NSArray *)persons;

- (void)addPerson:(BNPerson *)person;
- (void)removePerson:(BNPerson *)person;

@end
