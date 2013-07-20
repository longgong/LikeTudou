//
//  TableViewController.h
//  LikeTudou
//
//  Created by Ibokan on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface TableViewController : UITableViewController<ASIHTTPRequestDelegate>

@property (nonatomic, retain) NSArray * datas;

@property (nonatomic, retain) NSMutableData * recieveData;

@end
