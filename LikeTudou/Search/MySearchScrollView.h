//
//  MySearchScrollView.h
//  LikeTudou
//
//  Created by gdm on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapLabelTagProtocol.h"

@interface MySearchScrollView : UIScrollView<ASIHTTPRequestDelegate>

@property(nonatomic,retain)UIViewController<TapLabelTagProtocol> * searchController;

@end
