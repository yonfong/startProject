//
//  YFDatabaseManager.h
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFDatabaseManager : NSObject

//账号信息表
+ (WCTTable *)accountTable;

@end

NS_ASSUME_NONNULL_END
