//
//  MainWeather.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "BaseWeatherData.h"


@interface MainWeather : BaseWeatherData

@property (nonatomic, assign, readonly) CGFloat temperature;
@property (nonatomic, assign, readonly) CGFloat temperatureMax;
@property (nonatomic, assign, readonly) CGFloat temperatureMin;
@property (nonatomic, assign, readonly) CGFloat pressure;
@property (nonatomic, assign, readonly) NSInteger humidity;

@end
