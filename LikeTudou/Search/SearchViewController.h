//
//  SearchViewController.h
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySearchBar.h"
#import "MySearchScrollView.h"
#import "TapLabelTagProtocol.h"
#import "ASIHTTPRequestDelegate.h"
#import "EGORefreshTableHeaderView.h"

@interface SearchViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,TapLabelTagProtocol,ASIHTTPRequestDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView * _refreshHeaderView;
    BOOL _reloading; //刷新判断
}

@property(nonatomic,retain)MySearchBar * searchBar;
@property(nonatomic,retain)UISearchDisplayController * searchCtrl;
@property(nonatomic,retain)UIToolbar * searchToolBar;

@property(nonatomic,retain)MySearchScrollView * aScrollView;

@property(nonatomic,retain)UITableView * showResultTableView; //显示搜索的记录的表

@property(nonatomic,retain)NSMutableArray * resultDatas; //记录详情


- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
