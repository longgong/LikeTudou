//
//  TapLabel.m
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "TapLabel.h"

@implementation TapLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.textColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTapAction:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        [tap release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)goTapAction:(UITapGestureRecognizer *)sender
{    
    [UIView animateWithDuration:0.3f animations:^{
        
        sender.view.frame = CGRectInset(sender.view.frame, 2, 2);
        
    } completion:^(BOOL finished) {
        
        sender.view.frame = CGRectInset(sender.view.frame, -2, -2);
        [self.tapDelegate skipToSearchPage:(UILabel *)sender.view];
        
    }];
}

@end
