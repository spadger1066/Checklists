//
//  ChecklistsAppDelegate.m
//  Checklists
//
//  Created by Stephen on 15/04/2014.
//  Copyright (c) 2014 Vantech. All rights reserved.
//

#import "ChecklistsAppDelegate.h"
#import "AllListsViewController.h"
#import "DataModel.h"

@implementation ChecklistsAppDelegate {
	DataModel *_dataModel;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	_dataModel = [[DataModel alloc] init];

	UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;

	AllListsViewController *controller = navigationController.viewControllers[0];

	controller.dataModel = _dataModel;

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)saveData{
	UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
	AllListsViewController *controller = navigationController.viewControllers[0];
	[_dataModel saveChecklists];
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
	[self saveData];
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
	[self saveData];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
