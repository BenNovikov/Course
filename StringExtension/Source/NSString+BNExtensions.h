//
//  NSString+BNExtensions.h
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString_BNExtensions : NSString

+ (NSString *)BN_JSONString:(id)anArrayOrDictionary withOptions:(NSUInteger)optionsPrettyPrint;

@end
