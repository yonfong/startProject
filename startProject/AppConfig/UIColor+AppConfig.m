//
//  UIColor+AppConfig.m
//  startProject
//
//  Created by sky on 2020/10/29.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "UIColor+AppConfig.h"

@implementation UIColor (AppConfig)

+ (UIColor *)appThemeColor {
    return [UIColor colorFromHexString:@"#FE5200"];
}

+ (UIColor *)commonBackgroundColor {
    return [UIColor colorFromHexString:@"#F6F6F6"];
}

+ (UIColor *)textBlack {
    return [UIColor colorFromHexString:@"#333333"];
}

+ (UIColor *)textDarkGray {
    return [UIColor colorFromHexString:@"#666666"];
}

+ (UIColor *)textLightGray {
    return [UIColor colorFromHexString:@"#888888"];
}

+ (UIColor *)lightSeparatorLine {
    return [UIColor colorFromHexString:@"#E5E5E5"];
}

+ (UIColor *)darkSeparatorLine {
    return [UIColor colorFromHexString:@"#F5EADA"];
}

@end
