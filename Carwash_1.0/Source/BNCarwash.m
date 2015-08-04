//
//  BNCarwash.m
//  Course
//
//  Created by Admin on 7/15/15.
//  Copyright © 2015 ___IDAP College___. All rights reserved.
//

#import "BNCarwash.h"

static NSString const *kBNCarwashMessageNoMoneyToPay    = @"%@ has just $%5.02f.Sorry, no credit here\n";
static NSString const *kBNCarwashMessageLookingForBay   = @"%@ is busy now. Select next bay...";
static NSString const *kBNCarwashMessageBusyCarwash     = @"Dear %@! We are sorry, but all the bays are busy now. Wait or come later please!";

@implementation BNCarwash

#pragma mark -
#pragma mark Class Methods
+ (id)createWithBuilding:(BNBuilding *)building
                    boss:(BNBoss *)boss
              accountant:(BNAccountant *)accountant
              carwashers:(NSArray *)carwashers
{
    return [[[self alloc] initWithBuilding:(BNBuilding *)building
                                      boss:(BNBoss *)boss
                                accountant:(BNAccountant *)accountant
                                carwashers:(NSArray *)carwashers] autorelease];
}

+ (id)createWithBuilding:(BNBuilding *)building {
    return [[[self alloc] initWithBuilding:(BNBuilding *)building] autorelease];
}

#pragma mark -
#pragma mark Init and Declare

- (void)dealloc {
    self.building = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithBuilding:nil boss:nil accountant:nil carwashers:nil];
}

- (instancetype)initWithBuilding:(BNBuilding *)currentBuilding {
    self = [super init];
    if(self){
        [self setBuilding:currentBuilding];
        [self setNextBay:0];
    }
    
    return self;
}

- (instancetype)initWithBuilding:(BNBuilding *)currentBuilding
                        boss:(BNBoss *)boss
                  accountant:(BNAccountant *)accountant
                  carwashers:(NSArray *)carwashers
{
    self = [super init];
    if(self){
        [self setBuilding:currentBuilding];
        [self setNextBay:0];
        
        BNRoom *office  = [self.building office];
        NSUInteger count = [office.persons count];
        for (NSUInteger index = 0; index < count; index++){
            [office removePerson:[office.persons firstObject]];
        }
        [self.building.office addPerson:accountant];
        [self.building.office addPerson:boss];        
        NSArray *bays   = [self.building bays];
        
        for (BNRoom *bay in bays) {
            for (NSUInteger index = 0; index < [[bay persons] count]; index++){
                [bay removePerson:[[bay persons] firstObject]];
            }
        }
        count = MIN([bays count],[carwashers count]);
        
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
        if(self.price > client.money) {
            NSLog(kBNCarwashMessageNoMoneyToPay, client, client.money);
        } else {
            NSUInteger currentNextBay = self.nextBay;
            NSUInteger maxIndex = [self.building.bays count] - 1;
            do {
                BNRoom *bay = [self.building.bays objectAtIndex:currentNextBay];
                BNStaff *carwasher = [[bay persons] firstObject];
                
                if(nil != carwasher && NO == [carwasher isBusy]) {
                    [bay addPerson:client];
                    self.nextBay = (maxIndex != currentNextBay) ? ++ currentNextBay : 0;
                    [carwasher performOperationHoursDuties:self];
                    
                    break;
                } else {
                    NSLog(kBNCarwashMessageLookingForBay, carwasher);
                    currentNextBay = (maxIndex != currentNextBay) ? ++currentNextBay : 0;
                }
            } while (currentNextBay != self.nextBay);
            if (NO == client.isClean) {
                NSLog(kBNCarwashMessageBusyCarwash, client);
            }
        }
    }
    
    return client.isClean;
}

- (void)closeDown {
    if (nil != self) {
        BNRoom  *office     = [self.building office];
        BNStaff *accountant = [office.persons firstObject];
        BNStaff *boss       = [office.persons lastObject];
        
        NSArray *bays   = [self.building bays];
        for (BNRoom *bay in bays) {
            for (NSUInteger index = 0; index < [bay.persons count]; index++){
                [[bay.persons firstObject] performAfterOperationHoursDuties:self];
            }
        }
        
        [accountant performAfterOperationHoursDuties:self];
        [boss       performAfterOperationHoursDuties:self];
    }
}

#pragma mark -
#pragma mark Private Methods

@end
