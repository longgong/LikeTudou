//
//  LocalCache.h
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalCache : NSObject

+ (void) resetCache;

+ (NSString *)cacheDirectory;//返回缓存目录文件夹

+ (void) setObject:(NSData*)data forKey:(NSString*)key;
+ (id) objectForKey:(NSString*)key;

@end
