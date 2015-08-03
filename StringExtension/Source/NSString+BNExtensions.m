//
//  NSString+BNExtensions.m
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSString+BNExtensions.h"

@implementation NSString (NSString_BNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)downloadJSONfromURL:(NSString *)url;
{
    NSError *error = nil;
    NSString *message = kBNErrorNoParameter;
    if (nil != url)
    {
        NSString *dataURL = [NSString stringWithFormat:@"%@", url];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:dataURL]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if (nil != response) {
            NSString *jsonString = [[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding] autorelease];
            
            return jsonString;
        }
        message = kBNErrorReadJSON;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary
{
    NSError *error = nil;
    NSString *message = kBNErrorNoParameter;
    if (nil != dictionary)
    {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        NSString *jsonString = [[[NSString alloc] initWithData:jsonData
                                                      encoding:NSUTF8StringEncoding] autorelease];
        if (nil == error) {
            
            return jsonString;
        }
        message = kBNErrorConvertToString;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonString options:(NSUInteger)optionsPrettyPrint
{
    NSError *error = nil;
    NSString *message = kBNErrorNoParameter;
    
    if (nil != jsonString)
    {
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error;
        NSDictionary *jsonDictionary = [[self new] autorelease];
        jsonDictionary  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:optionsPrettyPrint
                                                            error:&error];

        if ([NSJSONSerialization isValidJSONObject:jsonDictionary]) {
            return jsonDictionary;
        }
        message = kBNErrorConvertToDictionary;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

+ (NSString *)alphabetAlphanumeric {
    return [[NSString alphabetNumeric] stringByAppendingString:[NSString alphabetLiteral]];
}
+ (NSString *)alphabetNumeric {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('0', '9' - '0' + 1)];
}

+ (NSString *)alphabetLiteral {
    return [[NSString alphabetCapitalized] stringByAppendingString:[NSString alphabetLowercase]];
}

+ (NSString *)alphabetLowercase {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('a', 'z' - 'a' + 1)];
}

+ (NSString *)alphabetCapitalized {
    return [NSString alphabetWithUnicodeRange:NSMakeRange('A', 'Z' - 'A' + 1)];
}

+ (NSString *)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [string appendFormat:@"%C", character];
    }
    
    return string;
}

+ (NSString *)randomUnicodeString {
    return [NSString randomUnicodeStringWithLength:kBNDefaultRangeLength
                                      range:NSMakeRange(kBNDefaultRangeLocation, kBNDefaultRangeLength)];
}

+ (NSString *)randomUnicodeStringWithLength:(NSUInteger)length {
    return [NSString randomUnicodeStringWithLength:length range:NSMakeRange(kBNDefaultRangeLocation, kBNDefaultRangeLength)];
}

+ (NSString *)randomUnicodeStringWithLength:(NSUInteger)length range:(NSRange)range {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    NSString *alphabet = [NSString alphabetWithUnicodeRange:range];
    
    for (NSUInteger counter = 0; counter < length; counter++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:arc4random_uniform((u_int32_t)range.length)]];
    }
    
    return [[[string copy] init] autorelease];
}

+ (NSString *)randomStringWithLength:(NSUInteger)length string:(NSString *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger counter = 0; counter < length; counter++) {
        [string appendFormat:@"%C", [alphabet characterAtIndex:arc4random_uniform((u_int32_t)alphabetLength)]];
    }
    
    return [[[string copy] init] autorelease];
}

@end
