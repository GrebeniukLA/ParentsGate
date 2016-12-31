//
//  Music.m
//  SpaceInvadersTutorial
//
//  Created by Barbara Köhler on 6/14/13.
//  Copyright (c) 2013 Barbara Köhler. All rights reserved.
//

#import "AudioFile.h"
#import <AVFoundation/AVFoundation.h>


@interface AudioFile() {
    AVAudioPlayer* audioPlayer;
}
@end

@implementation AudioFile

- (id)initWithFileNamed:(NSString *)fileName {
    self = [[AudioFile alloc] initWithFileNamed:fileName numberOfLoops:0];
    return self;
}

- (id)initWithFileNamed:(NSString *)fileName numberOfLoops:(int)numberOfLoops {
    self = [super init];
    if (self) {
        // set up everything to play background music
        NSURL* file = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
        [audioPlayer prepareToPlay];
        // this will play the music infinitely
        audioPlayer.numberOfLoops = numberOfLoops;
    }
    return self;
}

- (void)play {
    [audioPlayer play];
}

- (void)stop {
    [audioPlayer stop];
}

- (void)setVolume:(float)volume {
    [audioPlayer setVolume:volume];
}

@end
