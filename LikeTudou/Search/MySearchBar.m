//
//  MySearchBar.m
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "MySearchBar.h"

@implementation MySearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

- (void)layoutSubviews
{
    UITextField *searchField;
    NSUInteger numViews = [self.subviews count];
    for(int i = 0; i < numViews; i++) {
        if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) { //conform?
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    if(!(searchField == nil)) {
        [searchField setBorderStyle:UITextBorderStyleRoundedRect];
    }
    
    for(id bt in  self.subviews)
    {
        if([bt isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)bt;
            [btn setTitle:@"取消"  forState:UIControlStateNormal];
            UIImage * img = [UIImage imageNamed:@"search_cancel_bg"];
            
            [btn setBackgroundImage:img forState:UIControlStateNormal];
            [btn setBackgroundImage:img forState:UIControlStateSelected];
            [btn setBackgroundImage:img forState:UIControlStateHighlighted];
            
        }
    }

    
    [super layoutSubviews];

}

@end
