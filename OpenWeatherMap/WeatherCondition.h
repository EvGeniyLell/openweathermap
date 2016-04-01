//
//  WeatherCondition.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//
//  http://openweathermap.org/weather-conditions

#import "BaseWeatherData.h"


typedef NS_OPTIONS(NSUInteger, WeatherConditionMainOptions) {
    WeatherConditionMainUnknown = 0,
    
    WeatherConditionMainThunderstorm,
    WeatherConditionMainDrizzle,
    WeatherConditionMainRain,
    WeatherConditionMainSnow,
    WeatherConditionMainAtmosphere,
    WeatherConditionMainClear,
    WeatherConditionMainClouds,
    WeatherConditionMainExtreme,
    WeatherConditionMainAdditional,
    WeatherConditionMainMist,
};


@interface WeatherCondition : BaseWeatherData

@property (nonatomic, assign, readonly) NSUInteger uid;
@property (nonatomic, assign, readonly) WeatherConditionMainOptions main;
@property (nonatomic, strong, readonly) NSString *descript;

@end
