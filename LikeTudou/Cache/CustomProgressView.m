//
//  CustomProgressView.m
//  LikeTudou
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "CustomProgressView.h"


@implementation CustomProgressView
- (void)dealloc {
    [_progressImage release];
    [_progressTintColor release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _progress = 0.2;
        UIImageView * imgVBack = [[UIImageView alloc] initWithFrame:CGRectMake(_progress*frame.size.width, 0, frame.size.width*(1-_progress), frame.size.height)];
        imgVBack.tag = 105;
        imgVBack.backgroundColor = [UIColor greenColor];
        [self addSubview:imgVBack];  //底部背景
        [imgVBack release];
        
        UIImageView * imgVFront = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-imgVBack.frame.size.width, frame.size.height)];
        imgVFront.backgroundColor = [UIColor blueColor];
        imgVFront.tag = 106;
        [self addSubview:imgVFront]; //上面显示
        [imgVFront release];
        
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

- (void)setProgressImage:(UIImage *)progressImage
{
    
    if (_progressImage != progressImage) {
        [_progressImage release];
        _progressImage = [progressImage retain];
        
        UIImageView * imgVFront = (UIImageView *)[self viewWithTag:106];
        imgVFront.backgroundColor = [UIColor clearColor];
        imgVFront.image = _progressImage;
        
    }
}

- (void)setTrackImage:(UIImage *)trackImage
{
    
    if (_trackImage != trackImage) {
        [_trackImage release];
        _trackImage = [trackImage retain];
        
        UIImageView * imgBack = (UIImageView *)[self viewWithTag:105];
        imgBack.backgroundColor = [UIColor clearColor];
        imgBack.image = _trackImage;
        
    }
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    UIImageView * imgBack = (UIImageView *)[self viewWithTag:105];
    UIImageView * imgVFront = (UIImageView *)[self viewWithTag:106];
    _progress = progress;
    if (animated) {
        [UIView animateWithDuration:0.3f animations:^{
            
            imgVFront.frame = CGRectMake(0, 0, self.frame.size.width*_progress, imgVFront.frame.size.height);
            imgBack.frame = CGRectMake(_progress*self.frame.size.width, 0, self.frame.size.width*(1-_progress), imgBack.frame.size.height);
            
        }];
    } else {
        imgVFront.frame = CGRectMake(0, 0, self.frame.size.width*_progress, imgVFront.frame.size.height);
        imgBack.frame = CGRectMake(_progress*self.frame.size.width, 0, self.frame.size.width*(1-_progress), imgBack.frame.size.height);
    }
}

- (void)setProgress:(float)progress
{
    UIImageView * imgBack = (UIImageView *)[self viewWithTag:105];
    UIImageView * imgVFront = (UIImageView *)[self viewWithTag:106];
    _progress = progress;
    
    imgVFront.frame = CGRectMake(0, 0, self.frame.size.width*_progress, imgVFront.frame.size.height);
    imgBack.frame = CGRectMake(_progress*self.frame.size.width, 0, self.frame.size.width*(1-_progress), imgBack.frame.size.height);
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    UIImageView * imgVFront = (UIImageView *)[self viewWithTag:106];
    if (_progressTintColor != progressTintColor) {
        [_progressTintColor release];
        _progressTintColor = [progressTintColor retain];
        imgVFront.backgroundColor = _progressTintColor;
    }
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    UIImageView * imgBack = (UIImageView *)[self viewWithTag:105];
    if (_trackTintColor != trackTintColor) {
        [_trackTintColor release];
        _trackTintColor = [trackTintColor retain];
        imgBack.backgroundColor = _trackTintColor;
    }
}

@end
