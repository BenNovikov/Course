//
//  BNCarwash.m
//  Human
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwash.h"

@implementation BNCarwash

#pragma mark -
#pragma mark Class Methods
+ (id)createWithBuilding:(BNBuilding *)building
                withBoss:(BNBoss *)boss
          withAccountant:(BNAccountant *)accountant
          withCarwashers:(NSArray *)carwashers
{
    
    return [[[self alloc] initWithBuilding:(BNBuilding *)building
                                  withBoss:(BNBoss *)boss
                            withAccountant:(BNAccountant *)accountant
                            withCarwashers:(NSArray *)carwashers] autorelease];
}

+ (id)createWithBuilding:(BNBuilding *)building
{
    
    return [[[self alloc] initWithBuilding:(BNBuilding *)building] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.building = nil;
    
//    self.activeBays = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    return [self initWithBuilding:nil withBoss:nil withAccountant:nil withCarwashers:nil];
}

- (instancetype)initWithBuilding:(BNBuilding *)currentBuilding
{
    self = [super init];
    if(self){
        [self setBuilding:currentBuilding];
        [self setNextBay:0];
//        self.activeBays = [NSMutableArray arrayWithArray:self.building.bays];
    }
    
    return self;
}

- (instancetype)initWithBuilding:(BNBuilding *)currentBuilding
                        withBoss:(BNBoss *)boss
                  withAccountant:(BNAccountant *)accountant
                  withCarwashers:(NSArray *)carwashers
{
    self = [super init];
    if(self){
        [self setBuilding:currentBuilding];
        [self setNextBay:0];
        
        BNRoom *office  = [self.building office];
        NSUInteger count = [[office persons] count];
        for (NSUInteger index = 0; index < count; index++){
            [office removePerson:[[office persons] firstObject]];
        }
        [self.building.office addPerson:accountant];
        [self.building.office addPerson:boss];
        
        NSArray *bays   = [self.building bays];
        for (BNRoom *bay in bays) {
            for (NSUInteger index = 0; index < [[bay persons] count]; index++){
                [bay removePerson:[bay.persons firstObject]];
            }
        }
        count = MIN([bays count],[carwashers count]);
//        self.activeBays = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count ; index++) {
            [[bays objectAtIndex:index] addPerson:[carwashers objectAtIndex:index]];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods
- (BOOL)washCarOf:(BNClient *)client {
    if (nil != client) {
        if(self.price > [client money]) {
            NSLog(@"%@ has just $%5.02f.Sorry, no credit here\n", client, [client money]);
        } else {
            NSUInteger currentNextBay = self.nextBay;
            NSUInteger maxIndex = [self.building.bays count] - 1;
            do {
                BNRoom *bay = [[self.building bays] objectAtIndex:currentNextBay];
                BNStaff *carwasher = [bay.persons firstObject];
                
                if(nil != carwasher && NO == [carwasher isBusy]) {
                    [bay addPerson:client];
                    [self setNextBay:(maxIndex != currentNextBay) ? 1 + currentNextBay : 0];
                    [carwasher performOperationHoursDuties:self];
                    
                    break;
                } else {
                    NSLog(@"%@ is busy now. Select next bay...", carwasher);
                    currentNextBay = (maxIndex != currentNextBay) ? ++currentNextBay : 0;
                }
            } while (currentNextBay != self.nextBay);
            if (NO == [client isClean]) {
                NSLog(@"Dear %@! We are sorry, but all the bays are busy now. Wait or come later please!", client);
            }
        }
    }
    return [client isClean];
}

- (void)runOperationHours{
    
}

- (void)closeDown {
    if (nil != self) {
        NSLog(@"......It's late now! Sorry, but we gonna close for today!....");
        
        BNRoom  *office     = [self.building office];
        BNStaff *accountant = [[office persons] firstObject];
        BNStaff *boss       = [[office persons] lastObject];
        
        NSArray *bays   = [self.building bays];
        for (BNRoom *bay in bays) {
            for (NSUInteger index = 0; index < [[bay persons] count]; index++){
                [[[bay persons] firstObject] performAfterOperationHoursDuties:self];
            }
        }
        
        [accountant performAfterOperationHoursDuties:self];
        [boss       performAfterOperationHoursDuties:self];
    }
}

#pragma mark -
#pragma mark Private Methods

@end
