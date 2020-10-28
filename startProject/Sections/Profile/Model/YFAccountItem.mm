//
//  YFAccountItem.mm
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFAccountItem+WCTTableCoding.h"
#import "YFAccountItem.h"
#import <WCDB/WCDB.h>

@implementation YFAccountItem

WCDB_IMPLEMENTATION(YFAccountItem)
WCDB_SYNTHESIZE(YFAccountItem, accountId)
WCDB_SYNTHESIZE(YFAccountItem, avatar)
WCDB_SYNTHESIZE(YFAccountItem, mobile)
WCDB_SYNTHESIZE(YFAccountItem, nickName)
WCDB_SYNTHESIZE(YFAccountItem, token)

WCDB_SYNTHESIZE(YFAccountItem, loginDate)

WCDB_UNIQUE(YFAccountItem, accountId)
  
@end
