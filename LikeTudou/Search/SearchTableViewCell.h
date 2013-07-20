//
//  SearchTableViewCell.h
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView * imgView;//图片视图
@property(nonatomic,retain)UILabel * nameLabel;//电影名称
@property(nonatomic,retain)UILabel * typeLabel;//类型
@property(nonatomic,retain)UILabel * playTimeLabel;//播放次数
@property(nonatomic,retain)UILabel * directorLabel;//主演人
@property(nonatomic,retain)UILabel * regionLabel;//地区

@end
