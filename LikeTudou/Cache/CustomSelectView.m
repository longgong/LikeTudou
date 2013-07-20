//
//  CustomSelectView.m
//  LikeTudou
//
//  Created by mac on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "CustomSelectView.h"

@implementation CustomSelectView

- (void)dealloc
{
    [_leftImgView release];
    [_rightImgView release];
    [arrowView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImage * img1 = [self imageFromImage:[UIImage imageNamed:@"tab_bg.png"] inRect:CGRectMake(0, 0, 100 , 2)];
        UIImage * img2 = [self imageFromImage:[UIImage imageNamed:@"tab_bg_gray.png"] inRect:CGRectMake(0, 0, 100 , 2)];
        
        _leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 149, 30)];
        _leftImgView.image = img1;
        _leftImgView.highlightedImage = img2;
        _leftImgView.highlighted = YES;
        _leftImgView.userInteractionEnabled = YES;
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 149, 30)];
        label1.backgroundColor = [UIColor clearColor];
        label1.text = @"正在缓存";
        label1.textAlignment = NSTextAlignmentCenter;
        label1.userInteractionEnabled = YES;
        
        //左边缓存按钮时候
        UITapGestureRecognizer * leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goSelectLeftItem:)];
        [_leftImgView addGestureRecognizer:leftTap];
        [leftTap release];
        
        
        [_leftImgView addSubview:label1];
        [self addSubview:_leftImgView];
        [label1 release];
        
        _rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(151, 0, 149, 30)];
        _rightImgView.image = img1;
        _rightImgView.highlightedImage = img2;
        _rightImgView.userInteractionEnabled = YES;
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 149, 30)];
        label2.backgroundColor = [UIColor clearColor];
        label2.userInteractionEnabled = YES;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.text = @"缓存完成";
        
        //右边缓存按钮手势
        UITapGestureRecognizer * rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goSelectRightItem:)];
        [_rightImgView addGestureRecognizer:rightTap];
        [rightTap release];

        
        [_rightImgView addSubview:label2];
        [self addSubview:_rightImgView];
        [label2 release];
        
        
        arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 6, 6)];
        arrowView.center = CGPointMake(74.5, 27);
        arrowView.image = [UIImage imageNamed:@"pull_up"];
        [self addSubview:arrowView];
        
    }
    return self;
}

- (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect {
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//向右选中按钮
- (void)goSelectRightItem:(UITapGestureRecognizer *)sender
{
    self.leftImgView.highlighted = NO;
    self.rightImgView.highlighted = YES;
    [UIView animateWithDuration:0.3f animations:^{
        arrowView.center = CGPointMake(74.5+151, 27);
    }];
    
}

//向左选中按钮
- (void)goSelectLeftItem:(UITapGestureRecognizer *)sender
{
    self.leftImgView.highlighted = YES;
    self.rightImgView.highlighted = NO;
    [UIView animateWithDuration:0.3f animations:^{
        arrowView.center = CGPointMake(74.5, 27);
    }];
    
}

@end
