//
//  LAAnswerImage.h
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iPad    UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@interface LAAnswerImage : UIImageView

@property (nonatomic, strong) NSString* valueAnswer;
@property (nonatomic) BOOL correctAnswer;

- (void)setAnswer: (NSString*) answer;
- (void)setRightAnswer: (NSString*) answer;

@end
