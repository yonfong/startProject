//
//  AppDelegate.m
//  startProject
//
//  Created by sky on 2020/7/3.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "AppDelegate.h"
#import "YFTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
        
    YFTabBarController *tabbarCtl = [[YFTabBarController alloc] init];
    [self.window setRootViewController:tabbarCtl];
    
    [self.window makeKeyAndVisible];

    return YES;
}


@end
