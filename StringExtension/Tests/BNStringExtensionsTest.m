//
//  BNStringExtensionsTest.m
//  Course
//
//  Created by Admin on 15/08/03/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNStringExtensionsTest.h"

#import "BNAlphabet.h"
#import "BNRangeAlphabet.h"
#import "BNArrayAlphabet.h"
#import "BNStringAlphabet.h"
#import "BNDictionaryAlphabet.h"
#import "NSString+BNExtensions.h"

@implementation BNStringExtensionsTest

#pragma mark -
#pragma mark Public Method
+ (void)performJSONStringTest
{
//    NSString *myURL = @"http://echo.jsontest.com/key/value/one/two";
//    NSString *myURL = @"https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=breaking%20news";
    NSString *myURL = @"http://api.openweathermap.org/data/2.5/weather?q=Kiev";
    NSString *myJSONString = [NSString downloadJSONfromURL:myURL];
    NSDictionary *myDictionary = [NSString dictionaryFromJSONString:myJSONString options:0];
    NSInteger humidity = [[[myDictionary objectForKey:@"main"] objectForKey:@"humidity"] integerValue];
    NSInteger temperatureMax = [[[myDictionary objectForKey:@"main"] objectForKey:@"temp_max"] integerValue]- 273;
    NSInteger temperatureMin = [[[myDictionary objectForKey:@"main"] objectForKey:@"temp_min"] integerValue]- 273;
    NSArray *weather = [[myDictionary objectForKey:@"weather"] valueForKey:@"main"];
    NSLog(@"\nThe weather in Kiev: %@. Temperature: %ld-%ld\u00b0C. Humidity: %ld%%.\n\n",
          weather[0],
          temperatureMin,
          temperatureMax,
          humidity);

    //  get data and convert JSON String to NSDictionary:
    myURL = @"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22AAPL%22)&env=store://datatables.org/alltableswithkeys&format=json";
    myJSONString = [NSString downloadJSONfromURL:myURL];
    myDictionary = [NSString dictionaryFromJSONString:myJSONString options:0];
    NSDictionary *myData = [[[myDictionary objectForKey:@"query"]
                objectForKey:@"results"]
               objectForKey:@"quote"];
    NSArray *sortedKeys = [NSArray arrayWithObjects:
                           @"Ask",
                           @"Bid",
                           @"DaysHigh",
                           @"DaysLow",
                           @"LastTradeDate",
                           @"LastTradeTime",
                           @"Volume",
                           nil];
    
    NSMutableString *myString = [NSMutableString stringWithString:@"\nApple Inc. last trade session:\n"];
    
    for (NSString *key in sortedKeys) {
        [myString appendFormat:@"%@ : %@\n", key, [myData objectForKey:key]];
    }
    NSLog(@"%@\n", myString);

    //  convert JSON NSDictionary to String:
    myJSONString = [NSString JSONStringFromDictionary:myData];
//    NSLog(@"\nApple Inc. full data:\n%@\n", myJSONString);
    
    //  catching errors test
//    myJSONString = [NSString downloadJSONfromURL:nil];
//    myDictionary = [NSString dictionaryFromJSONString:nil options:0];
//    myJSONString = [NSString JSONStringFromDictionary:nil];
}

+ (void)performRandomStringTest
{
    NSLog(@"Alphanumeric    : %@",  [NSString alphabetAlphanumeric]);
    NSLog(@"Numeric         : %@",  [NSString alphabetNumeric]);
    NSLog(@"Literal         : %@",  [NSString alphabetLiteral]);
    NSLog(@"Lowercase       : %@",  [NSString alphabetLowercase]);
    NSLog(@"Capitalized     : %@",  [NSString alphabetCapitalized]);
    NSLog(@"Katakana        : %@",  [NSString alphabetWithUnicodeRange:NSMakeRange(0xff67, 0xff9d - 0xff67 + 1)]);
    NSLog(@"Cyrillic Letters: %@",  [NSString alphabetWithUnicodeRange:NSMakeRange(0x0410, 0x044f - 0x0410 + 1)]);

    NSLog(@"Random Unicode String with default length       : %@", [NSString randomUnicodeString]);
    NSLog(@"Random Unicode String with 16 symbols len       : %@", [NSString randomUnicodeStringWithLength:16]);
    NSLog(@"Random Unicode String with 20 cyrillic symbols  : %@",
          [NSString randomUnicodeStringWithLength:20
                                            range:NSMakeRange(0x0410, 0x044f - 0x0410 + 1)]);
    NSLog(@"Random String with 16 symbols of given alphabet : %@",
          [NSString randomStringWithLength:16
                                    string:[NSString alphabetAlphanumeric]]);
    
    NSString *myURL = @"http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss";
    NSString *myJSONString = [NSString downloadJSONfromURL:myURL];
    NSDictionary *myDictionary = [NSString dictionaryFromJSONString:myJSONString options:0];
    NSMutableString *myString = [[NSMutableString new] autorelease];

    [myString appendFormat:@"%@", [[myDictionary objectForKey:@"responseData"] objectForKey:@"feed"]];
    
    NSLog(@"Random String with 16 symbols of JSON string    : %@",
          [NSString randomStringWithLength:16 string:myJSONString]);

}

+ (void)performAlphabetTest
{
    NSLog(@"================= AlphabetTest started ...");
    BOOL testResult;
    BNAlphabet *alphabet;
   
    NSString *string = [NSString stringWithFormat:@"%@", [NSString alphabetAlphanumeric]];
    testResult = [string isKindOfClass:[NSString class]];
    NSAssert(testResult, @"Class mismatch");
    
    alphabet = [BNAlphabet alphabetWithRange:NSMakeRange('A', 'Z' - 'A' + 1)];
    testResult = [alphabet isKindOfClass:[BNRangeAlphabet class]];
    NSAssert(testResult, @"Class mismatch");    
    
    alphabet = [BNAlphabet alphabetWithString:@"SampleString"];
    testResult = [alphabet isKindOfClass:[BNStringAlphabet class]];
    NSAssert(testResult, @"Class mismatch");
    
    alphabet = [BNAlphabet alphabetWithArray:@[@"SampleString",@"AnotherString"]];
    testResult = [alphabet isKindOfClass:[BNArrayAlphabet class]];
    NSAssert(testResult, @"Class mismatch");
    
    NSDictionary *originalValues = @{ @"Ko" : @"prefix",
                                      @"Po" : @"prefix",
                                      @"zel": @"affix",
                                      @"za" : @"affix"};
    
    alphabet = [BNAlphabet alphabetWithDictionary:originalValues];
    testResult = [alphabet isKindOfClass:[BNDictionaryAlphabet class]];
    NSAssert(testResult, @"Class mismatch");
    
    NSLog(@"================= AlphabetTest finished O.K.");
}

@end
