//
//  YFAccountManager.h
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFAccountItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface YFAccountManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) YFAccountItem *currentAccount;

@end

NS_ASSUME_NONNULL_END
