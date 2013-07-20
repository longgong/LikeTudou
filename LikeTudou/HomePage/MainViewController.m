//
//  MainViewController.m
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_titleBar"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"top_titleBar"]];
	// Do any additional setup after loading the view.
    
//    _tableView = [[TableViewController alloc]initWithStyle:UITableViewStylePlain];
//    _tableView.view.frame = CGRectMake(0, 0, 320, 460);
//    [self.view addSubview:_tableView.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
