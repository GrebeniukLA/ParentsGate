//
//  LAAnswerImage.m
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import "LAAnswerImage.h"


@interface LAAnswerImage()
@property (strong,nonatomic) UILabel *label;
@end

@implementation LAAnswerImage

- (UILabel*)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        if (iPad) {
            [_label setFont:[UIFont fontWithName:@"Trebuchet MS" size:45]];
        } else {
            [_label setFont:[UIFont fontWithName:@"Trebuchet MS" size:25]];
        }
        _label.center = CGPointMake(32, 32);
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}

- (void)setAnswer:(NSString*)answer {
    self.label.text = answer;
}

- (void)setRightAnswer:(NSString*)answer {
    self.label.text = answer;
    self.correctAnswer = YES;
}


@end
