//
//  YFServerRequest.h
//  startProject
//
//  Created by sky on 2020/7/3.
//  Copyright © 2020 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YBNetwork/YBBaseRequest.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFServerRequest : YBBaseRequest

+ (instancetype)POST:(NSString *)URLString
          parameters:(nullable id)parameters
             success:(nullable YBRequestSuccessBlock)success
             failure:(nullable YBRequestFailureBlock)failure;

+ (instancetype)GET:(NSString *)URLString
         parameters:(nullable id)parameters
            success:(nullable YBRequestSuccessBlock)success
            failure:(nullable YBRequestFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
