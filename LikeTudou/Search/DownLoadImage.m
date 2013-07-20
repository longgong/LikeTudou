//
//  DownLoadImage.m
//  AsynchronousLoadImg
//
//  Created by gdm on 13-7-12.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "DownLoadImage.h"

@implementation DownLoadImage

- (void)dealloc
{
    [_urlString release];
    [_loadImg release];
    [_tableView release];
    [super dealloc];
}

- (id)initWithURLString:(NSString *)urlString andName:(NSString *)name andPlayTimes:(NSString *)times andChannelID:(int)theID
{
    if (self = [super init]) {
        _urlString = [urlString retain];
        UIImage * img = [self readImage];
        _filmName = [name retain];
        _playTimes = [times retain];
        _channelID = theID;
        
        if (img) {
            NSLog(@"本地读图片");
            self.loadImg = img;
        } else {
            [self downloadImageWithURLString:urlString];
        }
        
    }
    
    return self;
}

- (void)downloadImageWithURLString:(NSString *)urlString {
    NSURL * url = [NSURL URLWithString:urlString];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"图片%@下载完成",self.urlString);
    UIImage * theImage = [[UIImage alloc] initWithData:request.responseData];
    self.loadImg = theImage;
    [self.tableView reloadData];
    
    [self writeImage:request.responseData];
}

- (void)writeImage:(NSData *)data
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * imgName = [self.urlString stringByReplacingOccurrencesOfString:@"/" withString:@"+"];
    NSString * path = [cachePath stringByAppendingPathComponent:imgName];
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"写入图片成功");
    }
}

- (UIImage *)readImage
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * imgName = [self.urlString stringByReplacingOccurrencesOfString:@"/" withString:@"+"];
    NSString * path = [cachePath stringByAppendingPathComponent:imgName];
    
    UIImage * img = [UIImage imageWithContentsOfFile:path];
    return img;
}


@end
