//
//  NSString+BNExtensions.m
//  Course
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSString+BNExtensions.h"

@interface NSString_BNExtensions ()
//@property (nonatomic, retain)   NSMutableString     *mutableString;
//@property (nonatomic, copy)     NSString            *someString;
//
//- (NSString)BN_getString;
//- (void)BN_privateMethodWithString:(NSString *)string toAppendWith:(NSString *)appending;

@end

@implementation NSString_BNExtensions

#pragma mark -
#pragma mark Class Methods

+ (NSString *)BN_JSONString:(id)anArrayOrDictionary withOptions:(NSUInteger)optionsPrettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:anArrayOrDictionary
                                                       options:optionsPrettyPrint
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"An error ocurred: %@", error);
    } else {
        
        return [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public Methods

#pragma mark -
#pragma mark Private Methods
//
//- (NSString)BN_getString {
//    
//}
//
//- (void)BN_privateMethodWithString:(NSString *)string toAppendWith:(NSString *)appending {
//    
//    return string = [self appendString:appending];
//}

@end
