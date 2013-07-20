//
//  PlayerViewController.h
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ASIDownloadCache.h"

@interface PlayerViewController : UIViewController<ASIHTTPRequestDelegate>

@property(nonatomic,retain)MPMoviePlayerViewController * mpVC; //视频播放控制器

@property(nonatomic,retain)ASIDownloadCache * myCache;

@end
