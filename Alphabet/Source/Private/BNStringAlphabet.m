//
//  BNStringAlphabet.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNStringAlphabet.h"

@interface BNStringAlphabet()
@property (nonatomic, retain)   NSMutableString *mutableString;

@end

@implementation BNStringAlphabet

- (instancetype)alphabetWithString:(NSString *)string {

    return [self initWithString:string];
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (nil != self) {
        [self.mutableString appendString:string];
    }
    
    return self;
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
