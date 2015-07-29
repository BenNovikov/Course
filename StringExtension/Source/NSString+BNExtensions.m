//
//  NSString+BNExtensions.m
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSString+BNExtensions.h"

//@interface NSString (NSString_BNExtensions)
//@property (nonatomic, retain)   NSMutableString     *mutableString;
//@property (nonatomic, copy)     NSString            *someString;
//
//- (NSString)getString;
//- (void)privateMethodWithString:(NSString *)string toAppendWith:(NSString *)appending;
//
//@end

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

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonString withOptions:(NSUInteger)optionsPrettyPrint
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

        if (nil == error && [NSJSONSerialization isValidJSONObject:jsonDictionary]) {
            return jsonDictionary;
        }
        message = kBNErrorConvertToDictionary;
    }
    NSLog(@"%@:%@", message, error);
    
    return nil;
}

#pragma mark -
#pragma mark Public Methods

#pragma mark -
#pragma mark Private Methods
//
//- (NSString)getString {
//    
//}
//
//- (void)privateMethodWithString:(NSString *)string toAppendWith:(NSString *)appending {
//    
//    return string = [self appendString:appending];
//}

@end
