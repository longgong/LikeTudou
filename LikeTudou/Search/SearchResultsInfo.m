//
//  SearchResultsInfo.m
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "SearchResultsInfo.h"

@implementation SearchResultsInfo

- (void)dealloc
{
    [_loadImg release];
    [_urlString release];
    [super dealloc];
}



@end
