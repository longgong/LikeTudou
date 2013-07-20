//
//  CustomSelectView.h
//  LikeTudou
//
//  Created by mac on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSelectView : UIView
{
    @private
    UIImageView * arrowView; //向上箭头图标
}
@property(nonatomic,retain)UIImageView * leftImgView; //左侧选择视图
@property(nonatomic,retain)UIImageView *rightImgView; //右侧选择视图

@end
