//
//  LocalCache.m
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "LocalCache.h"

static NSTimeInterval cacheTime = (double)604800;

@implementation LocalCache

+ (NSString *)cacheDirectory
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cacheDirectory = [paths objectAtIndex:0];
    cacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"LongCaches"];
    return cacheDirectory;
}

+ (void)resetCache //重置缓存
{
    [[NSFileManager defaultManager] removeItemAtPath:[LocalCache cacheDirectory] error:nil];
}

+ (NSData *)objectForKey:(NSString *)key
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * fileName = [[LocalCache cacheDirectory] stringByAppendingPathComponent:key];
    
    if ([fileManager fileExistsAtPath:fileName]) {
        NSDate * modificationDate = [[fileManager attributesOfItemAtPath:fileName error:nil] objectForKey:NSFileModificationDate];  //获取文件修改日期
        if ([modificationDate timeIntervalSinceNow] > cacheTime) { //缓存是否过去
            [fileManager removeItemAtPath:fileName error:nil];
        } else {
            NSData * data = [NSData dataWithContentsOfFile:fileName];
            return data;
        }
        
    }
    return nil;
}

+ (void)setObject:(NSData *)data forKey:(NSString *)key
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * fileName = [[LocalCache cacheDirectory] stringByAppendingPathComponent:key];
    
    BOOL isDirectory = YES;
    if (![fileManager fileExistsAtPath:fileName isDirectory:&isDirectory]) {
        [fileManager createDirectoryAtPath:[LocalCache cacheDirectory] withIntermediateDirectories:YES attributes:noErr error:nil]; //  创建目录
    }
    
    NSError * error;
    @try {
        [data writeToFile:fileName options:NSDataWritingAtomic error:&error];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
}



@end
