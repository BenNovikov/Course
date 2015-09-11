//
//  BNRangeAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNRangeAlphabet.h"

@interface BNRangeAlphabet()
@property (nonatomic, assign)   NSRange range;

@end

@implementation BNRangeAlphabet

- (instancetype)alphabetWithRange:(NSRange)range {
    
    return [self initWithRange:range];
}

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (nil != self) {
        self.range = range;
    }
    
    return self;
}

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return (index < self.range.length) ? [NSString stringWithFormat:@"%C", (unichar)(self.range.length + index)] : nil;
}

#pragma mark -
#pragma mark Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len
{
    return [super countByEnumeratingWithState:state objects:buffer count:len];
}

@end
