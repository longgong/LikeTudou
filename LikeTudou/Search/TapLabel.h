//
//  TapLabel.h
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapLabelTagProtocol.h"

@interface TapLabel : UILabel

@property(nonatomic,assign)id<TapLabelTagProtocol>tapDelegate;

@end
