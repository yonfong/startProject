//
//  YFNavigationController.m
//  baike
//
//  Created by sky on 2020/7/3.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFNavigationController.h"

@interface YFNavigationController ()

@end

@implementation YFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavBarTheme];
}

- (void)configureNavBarTheme {
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = UIColor.whiteColor;
    self.navigationBar.translucent = NO;
    // 设置导航栏的标题颜色，字体
    NSDictionary *textAttrs = @{NSForegroundColorAttributeName:
                                    [UIColor whiteColor],
                                NSFontAttributeName:
                                    [UIFont systemFontOfSize:18],
                                };
    
    [self.navigationBar setTitleTextAttributes:textAttrs];
    [self.navigationBar setShadowImage:UIImage.new];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_nav_whiteBackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navGoBack)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    UIViewController *targetCtl = viewControllers.lastObject;
    if ([self.viewControllers indexOfObject:targetCtl] == NSNotFound) {
        targetCtl.hidesBottomBarWhenPushed = YES;
        
        targetCtl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_nav_whiteBackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navGoBack)];
    }
    [super setViewControllers:viewControllers animated:animated];
}

- (void)navGoBack {
    [self popViewControllerAnimated:YES];
}

@end
