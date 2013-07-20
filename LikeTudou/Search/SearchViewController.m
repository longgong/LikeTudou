//
//  SearchViewController.m
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "SearchViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "WriteRequestForKeyword.h"
#import "EncodeURL.h"
#import "PublicUserDefine.h"
#import "DownLoadImage.h"
#import "SearchTableViewCell.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)dealloc{
    [_searchCtrl release];
    [_searchToolBar release];
    [_searchBar release];
    [_aScrollView release];
    [_showResultTableView release];
    [_refreshHeaderView release];
    [super dealloc];
}

- (void)modifierSearchBar{
    if (!_searchBar) {
        _searchBar= [[MySearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        //修改搜索框背景
        _searchBar.backgroundColor=[UIColor clearColor];
        //去掉搜索框背景
        for (UIView *subview in _searchBar.subviews){
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
                [subview removeFromSuperview];
                break;
            }
        }
        _searchBar.delegate = self;
        _searchBar.barStyle = UIBarStyleBlackTranslucent;
        _searchBar.autocorrectionType = UITextAutocorrectionTypeDefault;
        _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _searchBar.placeholder = @"输入你想要的视频信息";
        _searchBar.keyboardType =  UIKeyboardTypeDefault;
    }
}

- (void)prepareDatas
{
    WriteRequestForKeyword * keywordFile = [[WriteRequestForKeyword alloc] initWithKeyword:@"致青春" andTag:101];
    [keywordFile release];
    
}

- (void)requestDatas:(NSString *)keyword
{
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://api.tudou.com/v3/gw?%@%@kw=%@&pageNo=1&pageSize=10&channelId=22&media=v&sort=s",kMethod,kAppKeyAndFormat,[EncodeURL encodeUrlStr:keyword]]]];
    request.delegate = self;
    [request startAsynchronous];
}

- (void)prepareUI
{
    [self modifierSearchBar];
    
    _resultDatas = [[NSMutableArray alloc] init];
    
    _searchCtrl = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchCtrl.delegate = self;
    _searchCtrl.searchResultsDataSource = self;
    _searchCtrl.searchResultsDelegate = self;
    _searchCtrl.searchResultsTableView.separatorColor = [UIColor grayColor];
    
    _searchCtrl.searchResultsTableView.frame = CGRectInset(_searchCtrl.searchResultsTableView.frame, 10, 0);
    

    _searchToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [_searchToolBar setBackgroundImage:[UIImage imageNamed:@"top_titleBar"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [_searchToolBar addSubview:_searchBar];
    [self.view addSubview:_searchToolBar];
    
    _aScrollView = [[MySearchScrollView alloc] initWithFrame:CGRectMake(0, 44, 320, 460-44-49)];
    _aScrollView.searchController = self;
    _aScrollView.contentSize = CGSizeMake(0, 460-44-49+1);
    [self.view addSubview:_aScrollView];
    
    _showResultTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 49, 310, 460-44-49-5) style:UITableViewStylePlain];
    _showResultTableView.delegate = self;
    _showResultTableView.dataSource = self;
    [self.view addSubview:_showResultTableView];
    self.showResultTableView.hidden = YES;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self prepareUI];
    
    if (_refreshHeaderView == nil) {
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-self.showResultTableView.bounds.size.height, self.showResultTableView.bounds.size.width, self.showResultTableView.bounds.size.height)];
        _refreshHeaderView.delegate = self;
        [self.showResultTableView addSubview:_refreshHeaderView];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_titleBar"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBarHidden = YES; //隐藏导航栏
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ttttttt");
    static NSString * identifier = @"cell";
    SearchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    
    DownLoadImage * img = [self.resultDatas objectAtIndex:indexPath.row];
    cell.imgView.image = img.loadImg;
    cell.nameLabel.text = img.filmName;
    cell.typeLabel.text = [self getFilmTypeByChannelID:img.channelID];
    cell.playTimeLabel.text = img.playTimes;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultDatas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


#pragma mark - TapLabelTapProtocol
- (void)skipToSearchPage:(UILabel *)tapLabel
{
    [self requestDatas:tapLabel.text];
    self.searchBar.text = tapLabel.text;
    self.searchBar.showsCancelButton = YES;
//    [self.searchBar becomeFirstResponder];
//    [self.searchCtrl.searchResultsTableView reloadData];
    self.searchCtrl.searchResultsTableView.hidden = YES;
    self.showResultTableView.hidden = NO;
    [self.showResultTableView reloadData];
    
    
    
}


#pragma mark - UISearchDisplayerController
- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    self.navigationController.navigationBarHidden = YES;
    NSLog(@"dfads");
}


#pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.showResultTableView.hidden = YES;
    self.searchBar.text = @"";
    [self.resultDatas removeAllObjects];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"adfs%@",dic);
    
    NSArray * results = [dic valueForKeyPath:@"multiPageResult.results"];
    
    for (NSDictionary * film in results) {
        
        NSString * urlString = [film objectForKey:@"picUrl"];
        NSString * filmName = [film objectForKey:@"title"];
        int channelID = [[film objectForKey:@"channelId"] intValue]; //频道ID
        long playTimes = [[film objectForKey:@"playTimes"] longValue];
        
        
        
        DownLoadImage * downImg = [[DownLoadImage alloc] initWithURLString:urlString andName:filmName andPlayTimes:[self getStringByPlayTimes:playTimes] andChannelID:channelID];
        [_resultDatas addObject:downImg];
        downImg.tableView = self.showResultTableView;
        [downImg release];
        [self.showResultTableView reloadData];
    }

    
}

//获得播放次数字符串
- (NSString *)getStringByPlayTimes:(long)times
{
    NSString * str = nil;
    
    if (times/1000000000000.0 >= 1) {
        //会自动四舍五入
        str = [NSString stringWithFormat:@"%.1f万亿次",times/1000000000000.0];
        
    } else if (times/100000000.0 >= 1) {
        
        str = [NSString stringWithFormat:@"%.1f亿次",times/100000000.0];
        
    } else if (times/10000.0 >= 1) {
    
        str = [NSString stringWithFormat:@"%.1f万次",times/10000.0];
        
    } else {
    
        str = [NSString stringWithFormat:@"%ld次",times];
        
    }
    return str;
}

//根据频道id获得电影类型
- (NSString *)getFilmTypeByChannelID:(int)theID
{
    NSString * str = nil;
    switch (theID) {
        case 0:{
            str = @"未知";
            break;
        }
            
        case 1:{
            str = @"娱乐";
            break;
        }
            
        case 3:{
            str = @"乐活";
            break;
        }
            
        case 5:{
            str = @"搞笑";
            break;
        }
            
        case 9:{
            str = @"动画";
            break;
        }
            
        case 10:{
            str = @"游戏";
            break;
        }
            
        case 14:{
            str = @"音乐";
            break;
        }
            
        case 15:{
            str = @"体育";
            break;
        }
            
        case 21:{
            str = @"科技";
            break;
        }
            
        case 22:{
            str = @"电影";
            break;
        }
            
        case 24:{
            str = @"财富";
            break;
        }
            
        case 25:{
            str = @"教育";
            break;
        }
            
        case 26:{
            str = @"汽车";
            break;
        }
            
        case 27:{
            str = @"女性";
            break;
        }
        
        case 28:{
            str = @"纪录片";
            break;
        }
            
        case 29:{
            str = @"热点";
            break;
        }
            
        case 30:{
            str = @"电视剧";
            break;
        }
            
        case 31:{
            str = @"综艺";
            break;
        }
            
        case 32:{
            str = @"风尚";
            break;
        }
            
        case 99:{
            str = @"原创";
            break;
        }
        default:
            break;
    }
    
    return str;
}

#pragma mark - DataSourceLoading
- (void)reloadTableViewDataSource
{
    _reloading = YES;
    
    //加载数据
    
}

- (void)doneLoadingTableViewData
{
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.showResultTableView];
    
    //刷新表格
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark EGORefreshTableHeaderDelegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadTableViewDataSource];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0f];
}

- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return _reloading;
}

@end
