//
//  YFServerRequest.m
//  startProject
//
//  Created by sky on 2020/7/3.
//  Copyright © 2020 Sky. All rights reserved.
//

#import "YFServerRequest.h"

static NSString *const YFBaseHostUrl = @"http://114.55.28.244:9001/api/";

@implementation YFServerRequest

- (instancetype)init {
    if (self = [super init]) {
        self.baseURI = YFBaseHostUrl;
    }
    return self;
}

+ (instancetype)POST:(NSString *)URLString
          parameters:(nullable id)parameters
             success:(nullable YBRequestSuccessBlock)success
             failure:(nullable YBRequestFailureBlock)failure {
    YFServerRequest *request = [[self alloc] init];
    request.requestMethod = YBRequestMethodPOST;
    request.requestURI = URLString;
    request.requestParameter = parameters;
    
    [request startWithSuccess:success failure:failure];
    
    return request;
}

+ (instancetype)GET:(NSString *)URLString
         parameters:(nullable id)parameters
            success:(nullable YBRequestSuccessBlock)success
            failure:(nullable YBRequestFailureBlock)failure {
    YFServerRequest *request = [[self alloc] init];
    request.requestMethod = YBRequestMethodGET;
    request.requestURI = URLString;
    request.requestParameter = parameters;
    
    [request startWithSuccess:success failure:failure];
    
    return request;
}

#pragma mark - override

- (AFHTTPRequestSerializer *)requestSerializer {
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer new];
    serializer.timeoutInterval = 60;
    
//    NSString *token = [YFAccountManager sharedManager].currentAccount.token;
//    if (token.length > 0) {
//        [serializer setValue:token forHTTPHeaderField:@"token"];
//        NSLog(@"\n ******** header token>>> %@", token);
//    }
    
    return serializer;
}

- (AFHTTPResponseSerializer *)responseSerializer {
    AFHTTPResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    
    NSSet *acceptableContentTypes = serializer.acceptableContentTypes;
    serializer.acceptableContentTypes = [acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html",@"text/plain",@"application/json",@"text/json",@"text/javascript"]];
    
    return serializer;
}

- (void)start {
    NSLog(@"发起请求：requsetUrl >%@ id>>%@", self.requestURI, self.requestIdentifier);
    [super start];
}

- (NSDictionary *)yb_preprocessParameter:(NSDictionary *)parameter {
    NSMutableDictionary *tmp = [NSMutableDictionary dictionaryWithDictionary:parameter ?: @{}];

    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [tmp setValue:version forKey:@"version"];
    
    
    NSLog(@"\n\n request>> %@ parameter>>> %@", self.requestURI,tmp);
    return tmp;
}

- (NSString *)yb_preprocessURLString:(NSString *)URLString {
    NSLog(@"\n\n URLString >> %@", URLString);
    
    return URLString;
}

- (void)yb_preprocessSuccessInChildThreadWithResponse:(YBNetworkResponse *)response {
   
}

- (void)yb_preprocessSuccessInMainThreadWithResponse:(YBNetworkResponse *)response {
    NSLog(@"\n\n request>> %@ response>>>> %@",self.requestURI, response.responseObject);
       
//    if (response.formatedResponse.code == -1) {
//        NSLog(@"\n\n warning xxxxx **** token inValid \n\n");
//        [YFAccountManager sharedManager].currentAccount = nil;
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"YFTokenInvalid" object:nil];
//    }
}


@end
