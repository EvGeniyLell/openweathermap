//
//  WeatherAPIClient.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface WeatherAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

#import "WeatherAPIClient+CurrentWeatherData.h"
