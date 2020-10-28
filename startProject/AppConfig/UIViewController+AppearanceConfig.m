//
//  UIViewController+AppearanceConfig.m
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "UIViewController+AppearanceConfig.h"
#import <objc/runtime.h>

static const char *YFAutomaticallySetModalPresentationStyleKey;

@implementation UIViewController (AppearanceConfig)

+ (void)load {
    Method originAddObserverMethod = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
    Method swizzledAddObserverMethod = class_getInstanceMethod(self, @selector(yf_presentViewController:animated:completion:));
    method_exchangeImplementations(originAddObserverMethod, swizzledAddObserverMethod);
}

/**
 * 默认所有都不支持转屏,如需个别页面支持除竖屏外的其他方向，请在viewController重新下边这三个方法
 */
// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    return NO;
}

// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)setYf_automaticallySetModalPresentationStyle:(BOOL)LL_automaticallySetModalPresentationStyle {
    objc_setAssociatedObject(self, YFAutomaticallySetModalPresentationStyleKey, @(LL_automaticallySetModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)yf_automaticallySetModalPresentationStyle {
    id obj = objc_getAssociatedObject(self, YFAutomaticallySetModalPresentationStyleKey);
    if (obj) {
        return [obj boolValue];
    }
    return [self.class yf_automaticallySetModalPresentationStyle];
}

+ (BOOL)yf_automaticallySetModalPresentationStyle {
    if ([self isKindOfClass:[UIImagePickerController class]] || [self isKindOfClass:[UIAlertController class]]) {
        return NO;
    }
    return YES;
}

- (void)yf_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (viewControllerToPresent.yf_automaticallySetModalPresentationStyle) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
        [self yf_presentViewController:viewControllerToPresent animated:flag completion:completion];
    } else {
        // Fallback on earlier versions
        [self yf_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

@end
