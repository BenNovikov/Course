//
//  BNCreature.h
//  Human
//
//  Created by BenNovikov on 7/7/15.
//  Copyright (c) 2015 ___BasicNotation___. All rights reserved.
//

#ifndef Human_BNCreature_h
#define Human_BNCreature_h

typedef NS_ENUM(NSUInteger, BNCreatureGender) {
    BNCreatureGenderUndefined,
    BNCreatureGenderMale,
    BNCreatureGenderFemale
};

@interface BNCreature : NSObject

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly) NSArray     *children;
@property (nonatomic, assign)   NSUInteger   age;
@property (nonatomic, assign)   float      weight;

+ (id)creatureWithName:(NSString *)name withAge:(NSUInteger)age withWeight:(float)weight;

- (instancetype)initWithName:(NSString *)name withAge:(NSUInteger)age withWeight:(float)weight;

- (NSArray *)children;

- (void)addChild:(BNCreature *)child;

- (void)removeChild:(BNCreature *)child;

- (void)sayPhrase:(NSString *)phrase;

- (void)performGenderSpecificOperation;

@end


#endif
