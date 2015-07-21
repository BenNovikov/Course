//
//  main.m
//  Creature
//
//  Created by BenNovikov on 7/7/15.
//  Copyright (c) 2015 ___BasicNotation___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNCreature.h"
#import "BNMaleCreature.h"
#import "BNFemaleCreature.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNCreature *creatureSimon = [BNMaleCreature     creatureWithName:@"Simon" withAge:42 withWeight:80.0];
        BNCreature *creatureSuzie = [BNFemaleCreature   creatureWithName:@"Suzie" withAge:38 withWeight:55.0];
        BNCreature *creatureShaun = [BNMaleCreature     creatureWithName:@"Shaun" withAge:16 withWeight:60.0];
        BNCreature *creatureSarah = [BNFemaleCreature   creatureWithName:@"Sarah" withAge:13 withWeight:35.0];
        
        [creatureSimon addChild:creatureShaun];
        [creatureSimon addChild:creatureSarah];
        
        NSLog(@"\n%@ has children: \n%@", [creatureSimon description], [creatureSimon children]);
        
        NSArray *creatures = @[creatureSimon, creatureSuzie, creatureShaun, creatureSarah];
        for (BNCreature *creature in creatures) {
            [creature performGenderSpecificOperation];
        }
        
        [creatureSimon sayPhrase:@"Repeat after me!"];
    }
    
    return 0;
}
