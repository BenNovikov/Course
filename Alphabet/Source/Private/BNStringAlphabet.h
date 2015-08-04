//
//  BNStringAlphabet.h
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNAlphabet.h"

@interface BNStringAlphabet : BNAlphabet <NSFastEnumeration>

- (instancetype)alphabetWithString:(NSString *)string;

- (instancetype)initWithString:(NSString *)string;

@end
