//
//  KidsView.h
//  MinesWeeper
//
//  Created by Leonid Grebenyuk on 17/12/14.
//  Copyright (c) 2014 Leonid Grebenyuk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KidsView : UIView

@property (copy, readwrite, nonatomic) void (^correctAnswerBlock)(void);

@end
