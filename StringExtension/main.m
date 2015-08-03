//
//  main.m
//  StringExtension
//
//  Created by Admin on 15/07/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNStringExtensionsTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [BNStringExtensionsTest performJSONStringTest];
        [BNStringExtensionsTest performRandomStringTest];
    }
    
    return 0;
}
