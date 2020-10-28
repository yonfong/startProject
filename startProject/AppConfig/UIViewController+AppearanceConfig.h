//
//  UIViewController+AppearanceConfig.h
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AppearanceConfig)

/**
Whether or not to set ModelPresentationStyle automatically for instance, Default is [Class yf_automaticallySetModalPresentationStyle].

@return BOOL
*/
@property (nonatomic, assign) BOOL yf_automaticallySetModalPresentationStyle;

/**
 Whether or not to set ModelPresentationStyle automatically, Default is YES, but UIImagePickerController/UIAlertController is NO.

 @return BOOL
 */
+ (BOOL)yf_automaticallySetModalPresentationStyle;

@end

NS_ASSUME_NONNULL_END
