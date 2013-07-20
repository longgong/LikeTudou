//
//  CustomCell2.m
//  LikeTudou
//
//  Created by Ibokan on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "CustomCell2.h"

@implementation CustomCell2

-(void) dealloc{
    [_scrollView release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
        _scrollView.backgroundColor = [UIColor greenColor];
        [self addSubview:_scrollView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
