//
//  YFDatabaseManager.m
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFDatabaseManager.h"
#import <FCFileManager.h>
#import "YFAccountItem.h"

static NSString *const kAccountOfDatabaseName = @"kAccountOfDatabaseName";
static NSString *const kAccountOfTableName = @"kAccountOfTableName";

@interface YFDatabaseManager()

@property (nonatomic, strong) WCTDatabase *commonDatabase;

@end

@implementation YFDatabaseManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static YFDatabaseManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YFDatabaseManager alloc] init];
    });
    return instance;
}


#pragma mark - Private Method
- (NSString *)commonDatabasePath {
    return [[FCFileManager pathForDocumentsDirectory] stringByAppendingPathComponent:kAccountOfDatabaseName];
}


//账号信息表
+ (WCTTable *)accountTable {
    WCTTable *table = [[YFDatabaseManager sharedManager].commonDatabase getTableOfName:kAccountOfDatabaseName
                                                                             withClass:YFAccountItem.class];
    return table;
}

#pragma mark - Property
- (WCTDatabase *)commonDatabase {
    if (_commonDatabase == nil) {
        _commonDatabase = [[WCTDatabase alloc] initWithPath:[self commonDatabasePath]];
        
        //创建相关数据表
        BOOL accountResult = [_commonDatabase createTableAndIndexesOfName:kAccountOfTableName withClass:YFAccountItem.class];
        if (!accountResult) {
            NSLog(@"YFUserItem table 创建失败");
        }
    }
    return _commonDatabase;
}
@end
