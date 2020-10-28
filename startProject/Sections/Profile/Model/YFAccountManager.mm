//
//  YFAccountManager.m
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFAccountManager.h"
#import "YFDatabaseManager.h"
#import "YFAccountItem+WCTTableCoding.h"


static void * kCurrentAccountItemContext = &kCurrentAccountItemContext;

@implementation YFAccountManager

+ (instancetype)sharedManager {
    static YFAccountManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        
        NSArray *list = [[YFDatabaseManager accountTable] getObjectsOrderBy:YFAccountItem.loginDate.order(WCTOrderedDescending) limit:1];
        if (list) {
            _sharedInstance.currentAccount = [list firstObject];
        }
    });
    
    return _sharedInstance;
}

- (void)setCurrentAccount:(YFAccountItem *)currentAccount {
    if (_currentAccount != currentAccount) {
        if (currentAccount) {
            [[YFDatabaseManager accountTable] insertOrReplaceObject:currentAccount];
            
            [self addObserverForAccountItem:currentAccount];
        } else {
            [self removeObserverForAccountItem:_currentAccount];

            BOOL ret = [[YFDatabaseManager accountTable] deleteObjectsWhere:(YFAccountItem.accountId == _currentAccount.accountId)];
            
            NSLog(@"\n\n ret>>> %d", ret);
        }
        _currentAccount = currentAccount;
    }
}

- (void)removeObserverForAccountItem:(YFAccountItem *)accountItem {
    if (!accountItem) {
        return;
    }
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([YFAccountItem class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //通过property_getName函数获得属性的名字
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];

        [accountItem removeObserver:self forKeyPath:propertyName];
    }
    //立即释放properties指向的内存
    free(properties);
}

- (void)addObserverForAccountItem:(YFAccountItem *)accountItem {
    if (!accountItem) {
        return;
    }
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([YFAccountItem class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //通过property_getName函数获得属性的名字
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];

        [accountItem addObserver:self forKeyPath:propertyName options:NSKeyValueObservingOptionNew context:kCurrentAccountItemContext];
    }
    //立即释放properties指向的内存
    free(properties);
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (context == kCurrentAccountItemContext && [object isKindOfClass:[YFAccountItem class]]) {
        NSLog(@"\n\n ************ keyPath == %@  change>>> %@  \n\n",keyPath, change);
        [[YFDatabaseManager accountTable] insertOrReplaceObject:object];
    }
}


@end
