//
//  SearchResultsInfo.h
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SearchResultsInfo : NSObject<ASIHTTPRequestDelegate>

@property(nonatomic,retain)UIImage * loadImg; //下载的图片
@property(nonatomic,retain)NSString * urlString;


@end
