//
//  TableViewController.m
//  LikeTudou
//
//  Created by Ibokan on 13-7-11.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import "CustomCell2.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [_datas release];
    [_recieveData release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _datas = [[NSArray alloc]initWithObjects:@"动漫",@"最热土豆",@"电视剧",@"电影",@"综艺",@"纪录片",@"土豆映像(原创)",@"音乐",@"娱乐", @"搞笑",@"科技.汽车",@"风尚.乐活",@"游戏.体育",@"教育",nil];
    
    
    
    NSString * urlString = @"http://api.tudou.com/v3/gw?method=album.channel.get&appKey=myKey&format=json&channel=t&pageNo=1&pageSize=10";
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setDelegate:self];
    [request startAsynchronous];
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"dic:%@",dic);
//    NSString * picChoiceUrl = [[[[dic valueForKeyPath:@"multiResult.results"]objectAtIndex:0]objectForKey:@"picChoiceUrl"]objectAtIndex:0];
//    NSLog(@"picChoice:%@",picChoiceUrl);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_datas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * identifer2 = @"cell1";
        CustomCell2 * cell2 = [tableView dequeueReusableCellWithIdentifier:identifer2];
        if (!cell2) {
            cell2 = [[[CustomCell2 alloc]init]autorelease];
        }
        return cell2;
    }
    static NSString *identifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[CustomCell alloc]init]autorelease];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor clearColor];
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_channel@2x.png"]];
    image.frame = CGRectMake(0, 8, 10, 24);
    [view addSubview:image];
    [image release];
    
    UILabel * nameLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 8, 100, 24)];
    nameLab.text = [_datas objectAtIndex:section];
    nameLab.backgroundColor = [UIColor clearColor];
    nameLab.textColor = [UIColor orangeColor];
    [view addSubview:nameLab];
    [nameLab release];
    
    UILabel * moreLab = [[UILabel alloc]initWithFrame:CGRectMake(240, 10, 60, 22)];
    moreLab.text = @"更多";
    moreLab.textAlignment = NSTextAlignmentRight;
    moreLab.textColor = [UIColor grayColor];
    moreLab.backgroundColor = [UIColor clearColor];
    [view addSubview:moreLab];
    [moreLab release];
    
    UIImageView * arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(300, 9, 14, 24)];
    arrowImage.image = [UIImage imageNamed:@"arrows@2x.png"];
    [view addSubview:arrowImage];
    [arrowImage release];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goTapHeader:)];
    [view addGestureRecognizer:tap];
    
    return view;
}

-(void)goTapHeader:(UITapGestureRecognizer *)recognizer{
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
