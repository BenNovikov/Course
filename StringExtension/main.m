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
        NSArray *jsonArray = @[@"{%\"menu%\": {",
                               @"%\"id%\": %\"file%\",",
                               @"%\"value%\": %\"File%\",",
                               @"%\"popup%\": {",
                               @"%\"menuitem%\": [",
                               @"{%\"value%\": %\"New%\", %\"onclick%\": %\"CreateNewDoc()%\"},",
                               @"{%\"value%\": %\"Open%\", %\"onclick%\": %\"OpenDoc()%\"},",
                               @"{%\"value%\": %\"Close%\", %\"onclick%\": %\"CloseDoc()%\"}",
                               @"]",
                               @"}",
                               @"}}"];
        
        NSString *string = [NSString BN_JSONString:jsonArray withOptions:0];
        NSLog(@"JSON Sring:%@", string);
        
    }
    return 0;
}
