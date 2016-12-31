//
//  Settings.h
//  Orfografia
//
//  Created by Leonid Grebenyuk on 5/3/14.
//  Copyright (c) 2014 com.hdgamestudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Settings : NSObject <AVAudioPlayerDelegate>

@property (nonatomic) BOOL isSound;
@property (nonatomic, readonly) BOOL isMelody;

+ (instancetype)data;

- (void)playIfOnSound:(NSString *)nameFile;
- (void)playMelodyTrack:(NSString *)nameFile;
- (void)stopMelodyTrack;

@end
