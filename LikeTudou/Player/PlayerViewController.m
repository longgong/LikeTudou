//
//  PlayerViewController.m
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "PlayerViewController.h"
#import "LocalCache.h"


@interface PlayerViewController ()
{
    NSString * key;
    NSMutableData * receiveData;
}
@end

@implementation PlayerViewController

- (void)dealloc
{
    [_mpVC release];
    [_myCache release];
    [key release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton * playerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playerBtn.frame = CGRectMake(0, 0, 80, 40);
    [playerBtn setTitle:@"播放" forState:UIControlStateNormal];
    [playerBtn addTarget:self action:@selector(goPlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playerBtn];
    
    _myCache = [[ASIDownloadCache alloc] init];
    NSString * cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"movieCache"];
    [_myCache setStoragePath:cachePath];
    [_myCache setDefaultCachePolicy:ASIUseDefaultCachePolicy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goPlay
{
//    NSString * urlString = @"http://v14.3g.sina.com.cn/tv/video/2013/06/04/6dce9b58285c0a/2642705_5.mp4?vud=4380834";
    NSString * urlString = @"http://www.tudou.com/playlist/p/l12373639.html";
    
    key = [urlString MD5Hash];
    NSData * data = [LocalCache objectForKey:key];
    NSURL * url = nil;
    if (data) { //有数据
        
        NSLog(@"bendi du");
        url = [NSURL fileURLWithPath:[[LocalCache cacheDirectory] stringByAppendingPathComponent:key]];
        
    } else {
        NSLog(@"network");
        url = [NSURL URLWithString:urlString];
    }

    
    _mpVC = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    _mpVC.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    _mpVC.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    _mpVC.moviePlayer.view.frame = CGRectMake(10, 80, 300, 250);
    [self.view addSubview:_mpVC.moviePlayer.view];
    [_mpVC.moviePlayer play];
    
    
//    if (!data) {
//        NSLog(@"gg");
//        ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
//        [request setDownloadCache:self.myCache];
//        [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
//        request.delegate = self;
//        [self.myCache pathToStoreCachedResponseDataForRequest:request];
//        [receiveData release];
//        receiveData = nil;
//        receiveData = [[NSMutableData alloc] init];
//        
//        [request startAsynchronous];
//    }
    
}


//-(NSString*) pathToCachedResponseDataForStr:(NSString*)aStr{
//    
//    NSURL *url = [NSURL URLWithString:aStr];
//    
//    NSString *temCa = [[ASIDownloadCache sharedCache] pathToCachedResponseDataForURL:url];
//    NSLog(@"temCa: %@\n",temCa);
//#if DEBUG_LOG
//    
//    NSLog(@"temCa: %@\n",temCa);
//    
//#endif
//    
//    return temCa;
//    
//}
////下载文件
//-(void)requestDataWithStr:(NSString*)aStr{
//    
//    NSURL *url = [NSURL URLWithString:aStr];
//    
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
//    [[ASIDownloadCache sharedCache] setShouldRespectCacheControlHeaders:NO];
//    [request setSecondsToCache:60*60*24*30];
//    [request setDownloadDestinationPath:
//     [[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:request]];
//    [request startAsynchronous];
//}


//- (void)requestStarted:(ASIHTTPRequest *)request
//{
//    [receiveData release];
//    receiveData = nil;
//    
//    receiveData = [[NSMutableData alloc] init];
//    NSLog(@"start");
//}

//- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data
//{
//    NSLog(@"chuan");
//   
//    [receiveData appendData:data];
//    if ([receiveData length] > 1024*20) {
//        NSLog(@"lll");
//        [receiveData setData:[NSData data]];
//        NSLog(@"%d",[receiveData length]);
//    }
//    
//}
//
//- (void)requestFinished:(ASIHTTPRequest *)request
//{
//    [receiveData release];
//    receiveData = nil;
//}
//
//- (void)requestFailed:(ASIHTTPRequest *)request
//{
//    NSLog(@"wancheng");
//    [receiveData release];
//    receiveData = nil;
//}

@end
