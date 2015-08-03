//
//  BNStringsAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNStringsAlphabet.h"

@implementation BNStringsAlphabet

+ (instancetype)alphabetWithString:(NSString *)string {
    
    return nil;
}

- (instancetype)initWithString:(NSString *)string {
    
    return [[BNStringsAlphabet alphabetWithString:string] autorelease] ;
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
