//
//  BNDictionaryAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNDictionaryAlphabet.h"

@interface BNDictionaryAlphabet()

//- (NSUInteger)countWithDictionary:(NSDictionary *)myDictionary;

@end

@implementation BNDictionaryAlphabet

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
//    NSUInteger count = [self countWithDictionary:self.dictionary];
    NSUInteger count = 1;
    
    return count;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

#pragma mark -
#pragma mark Private
//
//- (NSUInteger)countWithDictionary:myDictionary {
//    NSUInteger count = 0;
//    
//    for (BNAlphabet *alphabet in myDictionary.allKeys) {
//        count += [alphabet count];
//    }
//    
//    return count;
//}

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