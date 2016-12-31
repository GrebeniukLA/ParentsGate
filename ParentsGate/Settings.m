//
//  Settings.m
//  Orfografia
//
//  Created by Leonid Grebenyuk on 5/3/14.
//  Copyright (c) 2014 com.hdgamestudio. All rights reserved.
//


#import "Settings.h"
#import "AudioFile.h"

@interface Settings ()

@property (strong, nonatomic) NSMutableArray *soundsArray;

@end

@implementation Settings

NSString* const melodyTrack=@"sudoku_track.mp3";

AudioFile* tapAudio;

+ (instancetype)data {
    static Settings *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[self alloc] init];
    });
    return data;
}

- (NSMutableArray *)soundsArray {
    if (!_soundsArray) {
        _soundsArray = [NSMutableArray array];
    }
    return _soundsArray;
}

- (void)playMelodyTrack:(NSString *)nameFile {
    _isMelody = YES;
    tapAudio = [[AudioFile alloc] initWithFileNamed:nameFile numberOfLoops:-1];
    [tapAudio setVolume:1];
    [tapAudio play];
}

- (void)stopMelodyTrack {
    _isMelody = NO;
    [tapAudio stop];
}

- (void)playIfOnSound:(NSString *)nameFile {
    if ([self isSound]) {
        [self playSound:nameFile];
    }
}

- (void)playSound:(NSString *)nameFile {
    NSError *error;
    NSURL* file = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:nameFile ofType:nil]];
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:&error];
    [self.soundsArray addObject:audioPlayer];
    [audioPlayer setDelegate:self];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
#pragma mark AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.soundsArray removeObject:player];
}
@end
