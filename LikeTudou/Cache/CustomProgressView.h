//
//  CustomProgressView.h
//  LikeTudou
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomProgressView : UIView

@property(nonatomic,assign) float progress;

@property(nonatomic, retain) UIColor* progressTintColor; //已显示颜色
@property(nonatomic, retain) UIColor* trackTintColor; //未显示颜色

@property(nonatomic, retain) UIImage* progressImage ; //已显示背景图片
@property(nonatomic, retain) UIImage* trackImage; //未显示背景图片

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
