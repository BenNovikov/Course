//
//  BNAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNAlphabet.h"

#import "BNRangeAlphabet.h"
#import "BNArrayAlphabet.h"
#import "BNStringsAlphabet.h"
#import "NSString+BNExtensions.h"

@implementation BNAlphabet

#pragma mark -
#pragma mark Class Mathods

+ (instancetype)alphabetWithRange:(NSRange *)range {
    return [[BNRangeAlphabet initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[BNStringsAlphabet initWithString:string] autorelease];
}

+ (instancetype)alphabetWithArray:(NSArray *)array {
    return [[BNArrayAlphabet initWithArray:array] autorelease];
}

+ (instancetype)alphabetWithDictionary:(NSDictionary *)dictionary {
//    return [[[BNDictionaryAlphabet alloc] initWithDictionary:dictionary] autorelease];
    return nil;
}

#pragma mark -
#pragma mark Allocation and Initialization

- (void) dealloc {
    [super dealloc];
}

- (instancetype)initWithRange:(NSRange *)range {
    [self release];
    
    return [[BNRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithString:(NSString *)string {
    
    return [[BNStringsAlphabet alloc] initWithString:string];
}

- (instancetype)initWithArray:(NSArray *)array {
    
    return [[BNArrayAlphabet alloc] initWithArray:array];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
//    return [[BNDictionaryAlphabet alloc] initWithDictionary:dictionary];
    return nil;
}

#pragma mark -
#pragma mark Public Methods

//  methods to override in subclasses
- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}
// --------------------------------------

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    if (index < [self count]) {
        
        return [self stringAtIndex:index];
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)len
{
    
    return 0;
}

@end
