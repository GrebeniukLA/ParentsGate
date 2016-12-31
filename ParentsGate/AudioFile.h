//
//  Music.h
//  SpaceInvadersTutorial
//
//  Created by Barbara Köhler on 6/14/13.
//  Copyright (c) 2013 Barbara Köhler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioFile : NSObject

- (id)initWithFileNamed:(NSString*)fileName;
- (id)initWithFileNamed:(NSString*)fileName numberOfLoops:(int)numberOfLoops;

- (void)play;
- (void)stop;
- (void)setVolume:(float)volume;

@end
