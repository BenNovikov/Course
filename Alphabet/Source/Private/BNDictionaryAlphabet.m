//
//  BNDictionaryAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNDictionaryAlphabet.h"

@interface BNDictionaryAlphabet()
@property (nonatomic, retain) NSMutableDictionary *mutableDictionary;

- (NSUInteger)countWithDictionary:(NSDictionary *)dictionary;

@end

@implementation BNDictionaryAlphabet

- (instancetype)alphabetWithDictionary:(NSDictionary *)dictionary {
    
    return [self initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (nil != self) {
        [self.mutableDictionary addEntriesFromDictionary:dictionary];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    NSUInteger count = 1;
    
    return count;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithDictionary:(NSDictionary *)dictionary {
    NSUInteger count = 0;
    
    for (BNAlphabet *alphabet in dictionary.allKeys) {
        count += [alphabet count];
    }
    
    return count;
}

#pragma mark -
#pragma mark Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)len
{
    return [super countByEnumeratingWithState:state
                                      objects:buffer
                                        count:len];
}

@end