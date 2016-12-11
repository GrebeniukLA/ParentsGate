//
//  KidsView.m
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import "KidsView.h"
#import "LAKidsModel.h"
#import "LAAnswerImage.h"

@interface KidsView ()
@property (strong, nonatomic) LAAnswerImage  *answerImagesSelected;
@property (weak, nonatomic) IBOutlet UIImageView *placeForAnswer;
@property (strong, nonatomic) IBOutletCollection(LAAnswerImage) NSArray *answerImages;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (strong,nonatomic) NSArray *arrayAnswer;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIStackView *answerStackView;

@property (nonatomic) NSInteger typeGate;


@end

@implementation KidsView {
    CGPoint centerAnswer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self settingQuestion];
}


- (void)settingQuestion
{
    self.arrayAnswer = [LAKidsModel getRandomInts:4 from:11 to:89];
    [self layoutIfNeeded];
    for (LAAnswerImage* image in self.answerImages) {
        NSString* str= [NSString stringWithFormat:@"%li",[self.arrayAnswer[image.tag]longValue]];
        [image setAnswer: str ];
    }
    [self questionMulti];
}

- (void)questionMulti
{
    int firstNumber = arc4random()%6+4;
    int secondNumber =arc4random()%6+4;
    NSInteger rightAnswer;
    self.question.text = [NSString stringWithFormat:@"%li x %li = ", (long)firstNumber,(long)secondNumber];
    long answer = firstNumber*secondNumber;
    if ([self.arrayAnswer containsObject:[NSNumber numberWithLong:answer]]) {
        rightAnswer = [self.arrayAnswer indexOfObject:[NSNumber numberWithLong:answer]];
    } else {
        rightAnswer = arc4random()%4;
    }
    
    for (LAAnswerImage* image in self.answerImages) {
        if (image.tag == rightAnswer) {
            [image setRightAnswer:[NSString stringWithFormat:@"%i", firstNumber*secondNumber]];
        }
    }
}

#pragma mark touch Answer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches]anyObject];
    NSLog(@"%@", touch.view);
    for (LAAnswerImage* image in self.answerImages) {
        if([touch view]==image) {
            centerAnswer = image.center;
            self.answerImagesSelected = image;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.answerImagesSelected) {
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self];
        CGPoint center = CGPointMake(pointOnMainView.x - self.stackView.frame.origin.x, pointOnMainView.y - self.stackView.frame.origin.y);
        self.answerImagesSelected.center = center;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.answerImagesSelected) {
        UITouch *touch = [[event allTouches]anyObject];
        CGPoint pointOnMainView = [touch locationInView:self];
        CGRect rect = self.answerStackView.frame;
        
        if (CGRectContainsPoint(rect, pointOnMainView)&&self.answerImagesSelected.correctAnswer) {
            self.answerImagesSelected.center = self.placeForAnswer.center;
            [self removeFromSuperview];
            
            if (self.correctAnswerBlock) {
                self.correctAnswerBlock();
            }
        } else {
            self.answerImagesSelected.center = centerAnswer;
            [self settingQuestion];
        }
        self.answerImagesSelected = nil;
    }
}

- (IBAction)backAction:(id)sender {
    [self removeFromSuperview];
}


@end
