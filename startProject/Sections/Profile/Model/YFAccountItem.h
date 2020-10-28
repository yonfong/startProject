//
//  YFAccountItem.h
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFAccountItem : NSObject

@property (nonatomic, copy) NSString *accountId;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *token;

@property (nonatomic, strong) NSDate *loginDate;

@end
