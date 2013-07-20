//
//  BackgroudImageView.m
//  LikeTudou
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "BackgroudImageView.h"

@implementation BackgroudImageView

- (void)dealloc
{
    [showTitleLabel release];
    [detailSpaceLeftLabel release];
    [detailSpaceRightLabel release];
    [_showLeftSpaceLabel release];
    [_showRightSpaceLabel release];
    [_midView release];
    [_progressView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        
        UIView * aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        aView.backgroundColor = [UIColor clearColor];
        aView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        [self addSubview:aView];
        self.midView = aView;
        [aView release];
        
        UIImageView * midView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 60, 60)];
        midView.image = [UIImage imageNamed:@"dataless_download"];
        [self.midView addSubview:midView];
        [midView release];
        
        UILabel * propomtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 100, 40)];
        propomtLabel.textAlignment = NSTextAlignmentCenter;
        propomtLabel.backgroundColor = [UIColor clearColor];
        propomtLabel.font = [UIFont fontWithName:@"CourierNewPSMT" size:14];
        propomtLabel.text = @"暂无缓存视频喔";
        [self.midView addSubview:propomtLabel];
        [propomtLabel release];
        
        
        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(10,self.frame.size.height-30 , 300, 30)];
        backView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        [self addSubview:backView];
       
        _progressView = [[CustomProgressView alloc] initWithFrame:CGRectMake(0,15 , 300, 3)];
        _progressView.progressImage = [[UIImage imageNamed:@"arrow_plot"] stretchableImageWithLeftCapWidth:0 topCapHeight:35];
        _progressView.trackImage = [UIImage imageNamed:@"line_details.png"];
        [_progressView setProgress:0.5 animated:YES];
        [backView addSubview:_progressView];
        
        //左边标签
        detailSpaceLeftLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 0, 35, 15)];
        detailSpaceLeftLabel.text = @"总空间:";
        detailSpaceLeftLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:detailSpaceLeftLabel];
        
        _showLeftSpaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 0, 26, 15)];
        _showLeftSpaceLabel.text = @"6.31";
        _showLeftSpaceLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:_showLeftSpaceLabel];
        
        UILabel * aGLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, 7, 15)];
        aGLabel.text = @"G";
        aGLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:aGLabel];
        
        //右边标签
        detailSpaceRightLabel = [[UILabel alloc] initWithFrame:CGRectMake(215, 0, 45, 15)];
        detailSpaceRightLabel.text = @"可用空间:";
        detailSpaceRightLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:detailSpaceRightLabel];
        
        _showRightSpaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 26, 15)];
        _showRightSpaceLabel.text = @"3.31";
        _showRightSpaceLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:_showRightSpaceLabel];
        
        UILabel * bGLabel = [[UILabel alloc] initWithFrame:CGRectMake(286, 0, 7, 15)];
        bGLabel.text = @"G";
        bGLabel.font = [UIFont systemFontOfSize:10];
        [backView addSubview:bGLabel];
        
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

@end
