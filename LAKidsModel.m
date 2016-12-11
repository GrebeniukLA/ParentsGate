//
//  LAKidsModel.m
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import "LAKidsModel.h"

@implementation LAKidsModel

+(NSArray*)getRandomInts:(long)amount from:(long)fromInt to:(long)toInt{
    if ((toInt - fromInt) +1 < amount) {
        return nil;
    }
    
    NSMutableArray *uniqueNumbers = [[NSMutableArray alloc] init] ;
    long r;
    while ([uniqueNumbers count] < amount) {
        
        r = (arc4random() % (toInt-fromInt)) + fromInt;
        if (![uniqueNumbers containsObject:[NSNumber numberWithLong:r]]) {
            [uniqueNumbers addObject:[NSNumber numberWithLong:r]];
        }
    }
    return uniqueNumbers;
    
}

@end
