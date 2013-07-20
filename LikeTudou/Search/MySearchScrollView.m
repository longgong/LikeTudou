//
//  MySearchScrollView.m
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "MySearchScrollView.h"
#import "EncodeURL.h"
#import "TapLabel.h"
#import "WriteRequestForKeyword.h"
#import "ASIHTTPRequest.h"
#import "PublicUserDefine.h"


@implementation MySearchScrollView

- (void)dealloc
{
    [_searchController release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_common"]];
        
//         ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://api.tudou.com/v3/gw?%@%@kw=%@&pageNo=1&pageSize=10&channelId=22&media=v&sort=s",kMethod,kAppKeyAndFormat,[EncodeURL encodeUrlStr:@"致青春"]]]];
//        request.delegate = self;
//        [request startAsynchronous];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setSearchController:(UIViewController<TapLabelTagProtocol> *)searchController
{
    if (_searchController != searchController) {
        [_searchController release];
        _searchController = [searchController retain];
        
        NSArray * titleArr = [[NSArray alloc] initWithObjects:@"铁血玫瑰",@"爱在春天",@"致青春",@"好心作怪",@"上位",@"百变大伽秀",@"土豆周末秀",@"土豆最音乐",@"虫奉行",@"我们结婚了",@"非诚勿扰",@"火影忍者", nil];
        
//        for (int i = 0; i < 1; i++) {
//            WriteRequestForKeyword * writeOneFile = [[WriteRequestForKeyword alloc] initWithKeyword:titleArr[i] andTag:101+i];
//            [writeOneFile release];
//        }
        
        
        int height = 5;
        for (int i = 0; i < 4; i++) {
            int width = 5;
            for (int j = 0; j < 3; j++) {
                
                TapLabel * label = [[TapLabel alloc] initWithFrame:CGRectMake(width, height, 98.7, 84)];
                label.tag = i*3+j+101;
                label.text = titleArr[i*3+j];
                label.tapDelegate = _searchController;
                
                //根据关键字搜索视频信息，并储存到本地
                //搜索是视频
                

                
                
                
                [self addSubview:label];
                [label release];
                label = nil;
                width += 98.7+7;
            }
            height += 84+7;
        }
        
        [titleArr release];
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
//    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",dic);
//    
//    NSArray * array = [dic valueForKeyPath:@"multiPageResult.results"];
//    for (NSDictionary * singleDic in array) {
//        NSString * title = [singleDic objectForKey:@"title"];
//        NSLog(@"%@",title);
//    }
    
    
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"searchResults/search%d.plist",101]];
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",filePath);
    
    if (![dic writeToFile:filePath atomically:YES]) {
        NSLog(@"plist文件写入失败");
    }
    
}

@end
