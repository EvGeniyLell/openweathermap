//
//  WeatherAPIClient.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "WeatherAPIClient.h"
//#import "AFHTTPSessionManager.h"

static NSString * const WatherAPIClientKey = @"e7bd95961b5eea99e8d9ef16777d63a2";
static NSString * const WatherAPIClientBaseURLString = @"http://api.openweathermap.org/data/2.5";
static NSString * const WatherAPIClientNotificationReachabilityDidChanged = @"WeatherCityNotificationDataDidChanged";


#define waiting

@interface WeatherAPIClient()



@end


@implementation WeatherAPIClient

+ (instancetype)sharedClient {
    static WeatherAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WeatherAPIClient alloc] initWithBaseURL:[NSURL URLWithString:WatherAPIClientBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedClient;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))downloadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    NSMutableDictionary *parametersWithDafaultValue = [NSMutableDictionary new];
    [parametersWithDafaultValue addEntriesFromDictionary:@{@"APPID": WatherAPIClientKey,
                                                           @"units": @"metric"}];
    if (parameters) {
        [parametersWithDafaultValue addEntriesFromDictionary:parameters];
    }
    return [super GET:URLString parameters:parametersWithDafaultValue progress:downloadProgress success:success failure:failure];
}

+ (void)monitoringReachabilityStatusChangeWithBlock:(void (^)(AFNetworkReachabilityStatus status))block {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:block];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
