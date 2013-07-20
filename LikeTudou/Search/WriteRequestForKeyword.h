//
//  WriteRequestForKeyword.h
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestDelegate.h"

@interface WriteRequestForKeyword : NSObject<ASIHTTPRequestDelegate>

@property(nonatomic,retain)NSString * keyWord;
@property(nonatomic,assign)int tag;

- (id)initWithKeyword:(NSString *)keyword andTag:(int)tag;


@end
