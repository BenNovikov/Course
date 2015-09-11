//
//  TestTarget.m
//  TestTarget
//
//  Created by Student 103 on 7/30/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "BNAlphabet.h"
#import "BNRangeAlphabet.h"
#import "BNArrayAlphabet.h"
#import "BNStringAlphabet.h"
#import "BNDictionaryAlphabet.h"
#import "NSString+BNExtensions.h"

@interface TestTarget : XCTestCase

@end

@implementation TestTarget

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    
    BNAlphabet *alphabet = [BNAlphabet alphabetWithRange:NSMakeRange('A', 'Z' - 'A' + 1)];
    BOOL testResult = [alphabet isKindOfClass:[BNRangeAlphabet class]];
    NSAssert(testResult, @"Class mismatch");
    
    XCTAssert(testResult, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
