//
//  UIColor+AppConfig.h
//  startProject
//
//  Created by sky on 2020/10/29.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colours.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (AppConfig)

+ (UIColor *)appThemeColor;

+ (UIColor *)commonBackgroundColor;

+ (UIColor *)textBlack;

+ (UIColor *)textDarkGray;

+ (UIColor *)textLightGray;

+ (UIColor *)lightSeparatorLine;

+ (UIColor *)darkSeparatorLine;

@end

NS_ASSUME_NONNULL_END
