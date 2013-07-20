//
//  WriteRequestForKeyword.m
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "WriteRequestForKeyword.h"
#import "PublicUserDefine.h"
#import "EncodeURL.h"

@implementation WriteRequestForKeyword

- (void)dealloc {
    [_keyWord release];
    [super dealloc];
}

- (id)initWithKeyword:(NSString *)keyword andTag:(int)tag
{
    if (self = [super init]) {
        _keyWord = [keyword retain];
        _tag = tag;
        NSLog(@"lll");
        [self download];
    }
    
    return self;
}

- (void)download
{
    NSLog(@"fas %@,%d",self.keyWord,self.tag);
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://api.tudou.com/v3/gw?%@%@kw=%@&pageNo=1&pageSize=10&channelId=22&media=v&sort=s",kMethod,kAppKeyAndFormat,[EncodeURL encodeUrlStr:_keyWord]]]];
    request.delegate = self;
    [request startAsynchronous];
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"searchResults/search%d.plist",self.tag]];
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",filePath);
    
    if (![dic writeToFile:filePath atomically:YES]) {
        NSLog(@"plist文件写入失败");
    }
    
}

@end
