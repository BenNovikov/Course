//
//  BNRangeAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNRangeAlphabet.h"

@implementation BNRangeAlphabet

+ (instancetype)alphabetWithRange:(NSRange *)range {
    
    return nil;
}

- (instancetype)initWithRange:(NSRange *)range {
    
    return nil;
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
