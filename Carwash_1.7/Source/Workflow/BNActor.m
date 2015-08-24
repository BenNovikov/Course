//
//  BNActor.m
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNActor.h"

@implementation BNActor

+ (id)addActorWithPosition:(NSString *)position
                asConstant:(BOOL)constant
                     money:(double)money
                experience:(unsigned int)experience
                    reward:(unsigned int)reward
{
    return [[[self alloc] initActorWithPosition:(NSString *)position
                                     asConstant:(BOOL)constant
                                          money:(double)money
                                     experience:(unsigned int)experience
                                         reward:(unsigned int)reward]
            autorelease];}

- (instancetype)initActorWithPosition:(NSString *)position
                           asConstant:(BOOL)constant
                                money:(double)money
                           experience:(unsigned int)experience
                               reward:(unsigned int)reward {
    
    if (self = [super init]) {
        self.position = position;
        self.constant = constant;
        self.money = money;
        self.experience = experience;
        self.reward = reward;        
    };
    
    return self;
}

- (SEL)selectorForState:(BNActorState)state {
    
    return nil;
}

- (void)processWithObject:(BNActor *)object {
    
}

- (void)postprocessWithObject:(BNActor *)object {
    
}

@end
