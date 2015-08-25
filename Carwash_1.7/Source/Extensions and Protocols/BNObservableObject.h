//
//  BNObservableObject.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNStateProtocol.h"

@interface BNObservableObject : NSObject<BNStateProtocol>
//@property (nonatomic, assign) NSHashTable     *observers;
@property (nonatomic, assign) BNObjectState state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

@end