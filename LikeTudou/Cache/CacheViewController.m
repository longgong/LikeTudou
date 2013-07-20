//
//  CacheViewController.m
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "CacheViewController.h"
#import "LocalCache.h"
#import "NSString+MD5.h"
#import "PlayerViewController.h"

@interface CacheViewController ()

@end

@implementation CacheViewController

- (void)dealloc
{
    [_bgView release];
    [_selectView release];
    
    [_segCtrl release];
    
    [_aTableView release];
    [_aWebView release];
    [super dealloc];
}

- (void)prepareUIInterface
{
//    NSArray * titleItems = [[NSArray alloc] initWithObjects:@"正在缓存",@"缓存完成", nil];
//    _segCtrl =[[UISegmentedControl alloc] initWithItems:titleItems];
//    _segCtrl.segmentedControlStyle = UISegmentedControlStyleBordered;
//    _segCtrl.frame = CGRectMake(0, 0, 320, 30);
//    _segCtrl.selectedSegmentIndex = 0;
//    [self.view addSubview:_segCtrl];
//    [titleItems release];
    
    
    _selectView = [[CustomSelectView alloc] initWithFrame:CGRectMake(10, 5, 280, 30)];
    [self.view addSubview:_selectView];
    
    
    
    
    _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 45, 300, 460-44-30-49-5-30-10) style:UITableViewStylePlain];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    _aTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_common"]];
    [self.view addSubview:_aTableView];
    [self setExtraCellLineHidden:_aTableView];
    
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame = CGRectMake(50, 120, 80, 40);
//    [btn setTitle:@"anxia" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(goAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
    
//    _aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 200, 320, 260)];
//    
//    NSString * key = [@"http://www.baidu.com"  MD5Hash];
//    NSData * data = [LocalCache objectForKey:key];
//    if (data) {
//        NSLog(@"da");
//        [_aWebView loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    } else {
//        [_aWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
//        NSData * newData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//        [LocalCache setObject:newData forKey:key];
//    }
//    [self.view addSubview:_aWebView];
    
}

- (void)loadView
{
    _bgView = [[BackgroudImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460-44-49)];
    _bgView.image = [UIImage imageNamed:@"bg_common"];
    _bgView.userInteractionEnabled = YES;
    self.view = _bgView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"缓存管理";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_titleBar"] forBarMetrics:UIBarMetricsDefault];
	// Do any additional setup after loading the view.
    
    UIButton * btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:[UIImage imageNamed:@"btn_edit.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_complete"] forState:UIControlStateHighlighted];
    UIBarButtonItem * editBarItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = editBarItem;

    
    [self prepareUIInterface];
    
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://api.tudou.com/v3/gw?method=item.info.get&appKey=a88fbbdc0890e0cd&format=json&itemCodes=-ep7jmYZC2Y"]];
    request.delegate = self;
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSMutableDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"sf %@",dic);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
//        cell.backgroundView.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerViewController * playerVC = [[PlayerViewController alloc] init];
    [self.navigationController pushViewController:playerVC animated:YES];
    [playerVC release];
}

- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

- (void)goAction
{
    NSString *paramURLAsString= @"http://www.hao123.com/";
    
    if ([paramURLAsString length] == 0){
        
        NSLog(@"Nil or empty URL is given");
        return;
        
    }
    
    NSURLCache *urlCache = [NSURLCache sharedURLCache];
    
    
    /* 设置缓存的大小为1M*/
    
    [urlCache setMemoryCapacity:1*1024*1024];
    
    //创建一个nsurl
    
    NSURL *url = [NSURL URLWithString:paramURLAsString];
    
    //创建一个请求
    
    NSMutableURLRequest *request =
    
    [NSMutableURLRequest
     
     requestWithURL:url
     
     cachePolicy:NSURLRequestUseProtocolCachePolicy
     
     timeoutInterval:60.0f];
    
    //从请求中获取缓存输出
    
    NSCachedURLResponse *response =
    
    [urlCache cachedResponseForRequest:request];
    
    //判断是否有缓存
    
    if (response != nil){
        
        NSLog(@"如果有缓存输出，从缓存中获取数据");
        
        [request setCachePolicy:NSURLRequestReturnCacheDataDontLoad];
        
    }
    
    self.connection = nil;
    
    /* 创建NSURLConnection*/
    
    NSURLConnection *newConnection =
    
    [[NSURLConnection alloc] initWithRequest:request
     
                                    delegate:self
     
                            startImmediately:YES]; 
    
    self.connection = newConnection; 
    
    [newConnection release];
}

- (void)  connection:(NSURLConnection *)connection

  didReceiveResponse:(NSURLResponse *)response{
    
    NSLog(@"将接收输出");
    
}

- (NSURLRequest *)connection:(NSURLConnection *)connection

             willSendRequest:(NSURLRequest *)request

            redirectResponse:(NSURLResponse *)redirectResponse{
    
    NSLog(@"即将发送请求");
    
    return(request);
    
}

- (void)connection:(NSURLConnection *)connection

    didReceiveData:(NSData *)data{
    
    NSLog(@"接受数据");
    
    NSLog(@"数据长度为 = %lu", (unsigned long)[data length]);
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection

                  willCacheResponse:(NSCachedURLResponse *)cachedResponse{
    
    NSLog(@"将缓存输出");
    
    return(cachedResponse);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"请求完成");
    
}

- (void)connection:(NSURLConnection *)connection

  didFailWithError:(NSError *)error{
    
    NSLog(@"请求失败"); 
    
}

@end
