//
//  AppDelegate.m
//  LikeTudou
//
//  Created by gdm on 13-7-10.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ChannelViewController.h"
#import "SearchViewController.h"
#import "CacheViewController.h"
#import "SpaceViewController.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    UITabBarController * tabBarVC = [[UITabBarController alloc] init];
//    [tabBarVC.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_gray"]];
    [tabBarVC.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tab_clicked"]];
    
    MainViewController * mainVC = [[MainViewController alloc] init];
    ChannelViewController * channelVC = [[ChannelViewController alloc] init];
    SearchViewController * searchVC = [[SearchViewController alloc] init];
    CacheViewController * cacheVC = [[CacheViewController alloc] init];
    SpaceViewController * spaceVC = [[SpaceViewController alloc] init];
    
    UINavigationController * mainNavigationVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    UINavigationController * channelNavigationVC = [[UINavigationController alloc] initWithRootViewController:channelVC];
    UINavigationController * searchNavigationVC = [[UINavigationController alloc] initWithRootViewController:searchVC];
    UINavigationController * cacheNavigationVC = [[UINavigationController alloc] initWithRootViewController:cacheVC];
    UINavigationController * spaceNavigationVC = [[UINavigationController alloc] initWithRootViewController:spaceVC];
    
    [tabBarVC setViewControllers:@[mainNavigationVC,channelNavigationVC,searchNavigationVC,cacheNavigationVC,spaceNavigationVC] animated:YES];
    mainNavigationVC.tabBarItem.title = @"首页";
    mainNavigationVC.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    channelNavigationVC.tabBarItem.title = @"频道";
    channelNavigationVC.tabBarItem.image = [UIImage imageNamed:@"tab_channel"];
    searchNavigationVC.tabBarItem.title = @"搜索";
    searchNavigationVC.tabBarItem.image = [UIImage imageNamed:@"tab_search"];
    cacheNavigationVC.tabBarItem.title = @"缓存";
    cacheNavigationVC.tabBarItem.image = [UIImage imageNamed:@"tab_cache_sel"];
    spaceNavigationVC.tabBarItem.title = @"空间";
    spaceNavigationVC.tabBarItem.image = [UIImage imageNamed:@"tab_space"];
    
    [mainVC release];
    [channelVC release];
    [searchVC release];
    [cacheVC release];
    [spaceVC release];
    
    [mainNavigationVC release];
    [channelNavigationVC release];
    [searchNavigationVC release];
    [cacheNavigationVC release];
    [spaceNavigationVC release];
    
    self.window.rootViewController = tabBarVC;
    [tabBarVC release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
