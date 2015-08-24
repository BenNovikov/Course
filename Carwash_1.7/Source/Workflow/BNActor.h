//
//  BNActor.h
//  Course
//
//  Created by Admin on 15/08/24/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BNActorState) {
    kBNActorWaiting,
    kBNActorProcessing,
    kBNActorPostprocessing
};

@interface BNActor : NSObject

@property (nonatomic, assign) NSString                      *position;

/// To develop abstract scalable structure which could be used as carwash model some assumptions were made:
/// -   nonconstant actors (visitors) generate cashflow receiving service with money payed for
///     and disappear just after that;
/// -   constant actors make their job receiving salary at the end of the operation period (day, shift, etc.)
///     deallocating with money they get as a payment;
@property (nonatomic, assign, getter = isConstant)  BOOL    constant;

/// -   money transferred and counted means cash or any other account used and processed in workflow;
@property (nonatomic, assign)   double                      money;

/// -   experience is a staff job experience or loyal customers retention period for nonconstant actors;
@property (nonatomic, assign)   unsigned int                experience;

/// -   reward is money paid for the job done or rebates/special offers/discounts visitors receive;
@property (nonatomic, assign)   unsigned int                reward;

/// -   delegate is an actor who acts when calling actor's state changes.
@property (nonatomic, assign)   BNActor                     *delegate;

/// All the actors are generated by the dispatch center aka Enterprise meant in the task.

+ (id)addActorWithPosition:(NSString *)position
                asConstant:(BOOL)constant
                     money:(double)money
                experience:(unsigned int)experience
                    reward:(unsigned int)reward;

- (instancetype)initActorWithPosition:(NSString *)position
                           asConstant:(BOOL)constant
                                money:(double)money
                           experience:(unsigned int)experience
                               reward:(unsigned int)reward;

- (SEL)selectorForState:(BNActorState)state;

- (void)processWithObject:(BNActor *)object;

- (void)postprocessWithObject:(BNActor *)object;

@end
