//
//  main.m
//  StringExtension
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+BNExtensions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *myURL = @"http://echo.jsontest.com/key/value/one/two";
        
        NSString *myJSONString = [NSString downloadJSONfromURL:myURL];
        NSLog(@"JSON String: \n%@", myJSONString);
        
        //  convert JSON String to NSDictionary:
        NSDictionary *myDictionary = [NSString dictionaryFromJSONString:myJSONString withOptions:0];
        NSLog(@"JSON Dictionary: \n%@", myDictionary);
        
        //  convert JSON NSDictionary to String:
        myJSONString = [NSString JSONStringFromDictionary:myDictionary];
        NSLog(@"JSON String: \n%@", myJSONString);
        
        //  catching errors
        myJSONString = [NSString downloadJSONfromURL:nil];
        myDictionary = [NSString dictionaryFromJSONString:nil withOptions:0];
        myJSONString = [NSString JSONStringFromDictionary:nil];
    }
    
    return 0;
}
