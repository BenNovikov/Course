//
//  BNArrayAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNArrayAlphabet.h"

@interface BNArrayAlphabet ()
@property (nonatomic, retain) NSMutableArray *mutableArray;

- (NSUInteger)countWithArray:(NSArray *)array;

@end

@implementation BNArrayAlphabet

- (instancetype)alphabetWithArray:(NSArray *)array {

    return [self initWithArray:array];
}

- (instancetype)initWithArray:(NSArray *)array {    
    self = [super init];
    if (nil != self) {
        [self.mutableArray addObjectsFromArray:array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    NSUInteger count = [self countWithArray:self.myArray];

    return count;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSAssert(index < [self count], NSRangeException);
 
    return self.myArray[index];
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithArray:array {
    NSUInteger count = 0;
    
    for (BNAlphabet *alphabet in array) {
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
