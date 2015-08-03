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
    NSInteger temperatureMax = [[[myDictionary objectForKey:@"main"] objectForKey:@"temp_max"] integerValue]- 273.15;
    NSInteger temperatureMin = [[[myDictionary objectForKey:@"main"] objectForKey:@"temp_min"] integerValue]- 273.15;
    NSArray *weather = [[myDictionary objectForKey:@"weather"] valueForKey:@"main"];
    NSLog(@"\nKiev Forecast: %@\nTemperature Maximum: %ld\nTemperature Minimum: %ld\nHumidity: %ld\n\n",
          weather[0],
          temperatureMax,
          temperatureMin,
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
                           @"Volume", nil];
    
    NSMutableString *myString = [NSMutableString stringWithString:@"\nApple Inc. traded today:\n"];
    
    for (NSString *key in sortedKeys) {
        [myString appendFormat:@"%@ : %@\n", key, [myData objectForKey:key]];
    }
    NSLog(@"%@\n", myString);
    
    //
    //  convert JSON NSDictionary to String:
    //
//    myJSONString = [NSString JSONStringFromDictionary:myData];
//    NSLog(@"JSON String: \n%@", myJSONString);
//    [myData enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [myString appendFormat:@"%@ : %@\n", key, obj];
//    }];
//    NSLog(@"%@\n", myString);
    
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

@end
