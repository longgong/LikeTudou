//
//  CacheViewController.h
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroudImageView.h"
#import "CustomSelectView.h"

@interface CacheViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,ASIHTTPRequestDelegate>

@property(nonatomic,retain)UISegmentedControl * segCtrl; //分段控制器
@property(nonatomic,retain)UITableView * aTableView; //表视图
@property(nonatomic,retain)CustomSelectView * selectView;
@property(nonatomic,retain)NSURLConnection * connection;

@property(nonatomic,retain)BackgroudImageView * bgView; //背景视图

@property(nonatomic,retain)UIWebView * aWebView;

@end
