//
//  YBNetworkDefine.h
//  YBNetwork<https://github.com/indulgeIn/YBNetwork>
//
//  Created by 波儿菜 on 2019/4/3.
//  Copyright © 2019 波儿菜. All rights reserved.
//

#ifndef YBNetworkDefine_h
#define YBNetworkDefine_h

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif


#define YBNETWORK_QUEUE_ASYNC(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}

#define YBNETWORK_MAIN_QUEUE_ASYNC(block) YBNETWORK_QUEUE_ASYNC(dispatch_get_main_queue(), block)


NS_ASSUME_NONNULL_BEGIN

/// 请求类型
typedef NS_ENUM(NSInteger, YBRequestMethod) {
    YBRequestMethodGET,
    YBRequestMethodPOST,
    YBRequestMethodDELETE,
    YBRequestMethodPUT,
    YBRequestMethodHEAD,
    YBRequestMethodPATCH
};

/// 缓存存储模式
typedef NS_OPTIONS(NSUInteger, YBNetworkCacheWriteMode) {
    /// 无缓存
    YBNetworkCacheWriteModeNone = 0,
    /// 内存缓存
    YBNetworkCacheWriteModeMemory = 1 << 0,
    /// 磁盘缓存
    YBNetworkCacheWriteModeDisk = 1 << 1,
    YBNetworkCacheWriteModeMemoryAndDisk = YBNetworkCacheWriteModeMemory | YBNetworkCacheWriteModeDisk
};

/// 缓存读取模式
typedef NS_ENUM(NSInteger, YBNetworkCacheReadMode) {
    /// 不读取缓存
    YBNetworkCacheReadModeNone,
    /// 缓存命中后仍然发起网络请求
    YBNetworkCacheReadModeAlsoNetwork,
    /// 缓存命中后不发起网络请求
    YBNetworkCacheReadModeCancelNetwork,
};

/// 网络请求释放策略
typedef NS_ENUM(NSInteger, YBNetworkReleaseStrategy) {
    /// 网络任务会持有 YBBaseRequest 实例，网络任务完成 YBBaseRequest 实例才会释放
    YBNetworkReleaseStrategyHoldRequest,
    /// 网络请求将随着 YBBaseRequest 实例的释放而取消
    YBNetworkReleaseStrategyWhenRequestDealloc,
    /// 网络请求和 YBBaseRequest 实例无关联
    YBNetworkReleaseStrategyNotCareRequest
};

/// 重复网络请求处理策略
typedef NS_ENUM(NSInteger, YBNetworkRepeatStrategy) {
    /// 允许重复网络请求
    YBNetworkRepeatStrategyAllAllowed,
    /// 取消最旧的网络请求
    YBNetworkRepeatStrategyCancelOldest,
    /// 取消最新的网络请求
    YBNetworkRepeatStrategyCancelNewest
};

/// 网络请求回调重定向类型
typedef NS_ENUM(NSInteger, YBRequestRedirection) {
    /// 重定向为成功
    YBRequestRedirectionSuccess,
    /// 重定向为失败
    YBRequestRedirectionFailure,
    /// 停止后续操作（主要是停止回调）
    YBRequestRedirectionStop
};


@class YBBaseRequest;
@class YBNetworkResponse;


/// 进度闭包
typedef void(^YBRequestProgressBlock)(NSProgress *progress);

/// 缓存命中闭包
typedef void(^YBRequestCacheBlock)(YBNetworkResponse *response);

/// 请求成功闭包
typedef void(^YBRequestSuccessBlock)(YBNetworkResponse *response);

/// 请求失败闭包
typedef void(^YBRequestFailureBlock)(YBNetworkResponse *response);


/// 网络请求响应代理
@protocol YBResponseDelegate <NSObject>
@optional

/// 上传进度
- (void)request:(__kindof YBBaseRequest *)request uploadProgress:(NSProgress *)progress;

/// 下载进度
- (void)request:(__kindof YBBaseRequest *)request downloadProgress:(NSProgress *)progress;

/// 缓存命中
- (void)request:(__kindof YBBaseRequest *)request cacheWithResponse:(YBNetworkResponse *)response;

/// 请求成功
- (void)request:(__kindof YBBaseRequest *)request successWithResponse:(YBNetworkResponse *)response;

/// 请求失败
- (void)request:(__kindof YBBaseRequest *)request failureWithResponse:(YBNetworkResponse *)response;

@end

NS_ASSUME_NONNULL_END

#endif /* YBNetworkDefine_h */
