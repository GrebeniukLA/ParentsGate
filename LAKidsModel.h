//
//  LAKidsModel.h
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAKidsModel : NSObject

+(NSArray*)getRandomInts:(long)amount from:(long)fromInt to:(long)toInt;

@end
