//
//  BNCarwasher.h
//  SummerCourse
//
//  Created by Admin on 15/07/19/.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNStaff.h"
#import "BNClient.h"

@interface BNCarwasher : BNStaff

- (void)washCarOfClient:(BNRoom *)location;

@end
