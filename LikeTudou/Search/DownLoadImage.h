//
//  DownLoadImage.h
//  AsynchronousLoadImg
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface DownLoadImage : NSObject<ASIHTTPRequestDelegate>

@property(nonatomic,retain)UIImage * loadImg; //下载的图片
@property(nonatomic,retain)NSString * urlString; 
@property(nonatomic,retain)UITableView * tableView;

@property(nonatomic,retain)NSString * filmName; //电影名
@property(nonatomic,retain)NSString * playTimes; //播放量
@property(nonatomic,assign)int channelID; //频道ID


- (id)initWithURLString:(NSString *)urlString andName:(NSString *)name andPlayTimes:(NSString *)times andChannelID:(int)theID;

@end
