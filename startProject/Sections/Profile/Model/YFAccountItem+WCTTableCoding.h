//
//  YFAccountItem+WCTTableCoding.h
//  startProject
//
//  Created by sky on 2020/10/28.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFAccountItem.h"
#import <WCDB/WCDB.h>

@interface YFAccountItem (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(accountId)
WCDB_PROPERTY(avatar)
WCDB_PROPERTY(mobile)
WCDB_PROPERTY(nickName)
WCDB_PROPERTY(token)
WCDB_PROPERTY(loginDate)

@end
