//
//  BNAlphabet.h
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
NSRange BNAlphabetRangeWithClosedInterval(unichar lowerBound, unichar upperBound);

@interface BNAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange *)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithArray:(NSArray *)array;
+ (instancetype)alphabetWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithRange:(NSRange *)range;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

//  methods to override in subclasses
- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
- (NSString *)string;

@end
