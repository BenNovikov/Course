//
//  NSString+BNExtensions.h
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NS_STRING_KEY(key, value) static NSString *const key = value

NS_STRING_KEY(kBNErrorNoParameter, @"Parameter must not be null!");
NS_STRING_KEY(kBNErrorReadJSON, @"An error reading JSON");
NS_STRING_KEY(kBNErrorConvertToString, @"An error converting to string");
NS_STRING_KEY(kBNErrorConvertToDictionary, @"An error converting to dictionary");

@interface NSString (NSString_BNExtensions)

+ (NSString *)downloadJSONfromURL:(NSString *)url;
+ (NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)dictionaryFromJSONString:(NSString *)stringJson
                               withOptions:(NSUInteger)optionsPrettyPrint;

@end
