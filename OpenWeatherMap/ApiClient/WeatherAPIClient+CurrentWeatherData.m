//
//  WeatherAPIClient+CurrentWeatherData.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "WeatherAPIClient+CurrentWeatherData.h"

@implementation WeatherAPIClient (CurrentWeatherData)

- (NSURLSessionDataTask *)currentWeatherDataWithBlock:(void (^)(CurrentWeatherData *weather, NSError *error))block {
    return [self GET:@"forecast" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        CurrentWeatherData *weather = [CurrentWeatherData dataWithAttributes:JSON];
        if (block) {
            block(weather, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
