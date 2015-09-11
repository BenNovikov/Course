//
//  BNArrayAlphabet.h
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNAlphabet.h"

@interface BNArrayAlphabet : BNAlphabet <NSFastEnumeration>
@property   (nonatomic, readonly) NSArray *myArray;

- (instancetype)alphabetWithArray:(NSArray *)array;

- (instancetype)initWithArray:(NSArray *)array;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;
//- (NSUInteger)countWithArray:array;

@end
