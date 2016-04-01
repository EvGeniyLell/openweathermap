//
//  CurrentWeatherData.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "BaseWeatherData.h"
#import "WeatherCondition.h"
#import "MainWeather.h"
#import "WindCondition.h"
#import "WindCondition.h"
#import "SunCondition.h"

@interface CurrentWeatherData : BaseWeatherData

@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong, readonly) WeatherCondition * weather;
@property (nonatomic, strong, readonly) MainWeather * main;
@property (nonatomic, strong, readonly) WindCondition * wind;
@property (nonatomic, strong, readonly) SunCondition * sun;

@property (nonatomic, assign, readonly) NSTimeInterval lastUpdate;

@end
