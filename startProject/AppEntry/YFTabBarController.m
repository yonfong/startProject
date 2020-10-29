//
//  YFTabBarController.m
//  startProject
//
//  Created by sky on 2020/7/3.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFTabBarController.h"
#import "YFNavigationController.h"
#import "YFMainController.h"
#import "YFProfileController.h"

@interface YFTabBarController ()

@end

@implementation YFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTabBar];
    
    [self setupViewControllers];
}

- (void)configureTabBar {
    self.tabBar.barTintColor = UIColor.whiteColor;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor.blackColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:10],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor.redColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:10],NSFontAttributeName,nil] forState:UIControlStateSelected];
}

- (void)setupViewControllers {
    UIViewController *mainCtl = [[YFMainController alloc] init];
    UIViewController *profileCtl = [[YFProfileController alloc] init];
    
    self.viewControllers = @[
                             [self addNavigationItemForViewController:mainCtl],
                             [self addNavigationItemForViewController:profileCtl]
                            ];
    

    NSArray *titles = @[@"首页", @"我的"];
    NSArray *images = @[@"icon_tabbar_main", @"icon_tabbar_profile"];
    
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        item.tag = idx;
        [item setTitle:titles[idx]];
        [item setImage:[UIImage imageNamed:images[idx]]];
        [item setSelectedImage:[UIImage imageNamed:[images[idx] stringByAppendingString:@"_selected"]]];
    }];
}

- (UINavigationController *)addNavigationItemForViewController:(UIViewController *)viewController {
    YFNavigationController *navigationCtl = [[YFNavigationController alloc] initWithRootViewController:viewController];
    
    return navigationCtl;
}

// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.selectedViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.selectedViewController;
}

@end
