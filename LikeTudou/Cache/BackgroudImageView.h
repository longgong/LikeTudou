//
//  BackgroudImageView.h
//  LikeTudou
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomProgressView.h"

@interface BackgroudImageView : UIImageView
{
    @private
    UILabel * showTitleLabel;
    UILabel * detailSpaceLeftLabel;
    UILabel * detailSpaceRightLabel;
}

@property(nonatomic,retain)UIView * midView;
@property(nonatomic,retain)UILabel * showLeftSpaceLabel;
@property(nonatomic,retain)UILabel * showRightSpaceLabel;

@property(nonatomic,retain)CustomProgressView * progressView;

@end
