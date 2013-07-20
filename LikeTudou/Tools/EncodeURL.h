//
//  EncodeURL.h
//  地图demo
//
//  Created by sunpengzhen on 12-5-22.
//  Copyright (c) 2012年 北京博看文思科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface EncodeURL : NSObject {
    
}
+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding;

+(NSString *) encodeUrlStr:(NSString *)sourceString;
@end
