//
//  BNWorkflow.m
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNWorkflow.h"

@implementation BNWorkflow

+ (NSDictionary *)actorsData {
    static NSDictionary *data;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [NSDictionary dictionaryWithObjectsAndKeys:
                kBNActorsPosition,              @"position",
                kBNActorsConstant,              @"constant",
                kBNActorsMoney,                 @"money",
                kBNActorsExperienceUpperBound,  @"experience",
                kBNActorsRewardUpperBound,      @"reward",
                nil];
    });
    
    return data;
}

+ (NSArray *)labelNames {
    static NSArray *names;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        names = [NSArray arrayWithObjects:kBNActorsPosition count:kBNHierarchyLevels];
    });
    
    return names;
}



@end
