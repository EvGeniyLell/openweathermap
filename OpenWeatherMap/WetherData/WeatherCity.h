//
//  WeatherCity.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "BaseWeatherData.h"
#import "CurrentWeatherData.h"


static NSString * const WeatherCityNotificationDataDidChanged;


@interface WeatherCity : NSObject

@property (nonatomic, assign, readonly) NSUInteger uid;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *country;

@property (nonatomic, strong, readonly) CurrentWeatherData *currentWeather;

@property (nonatomic, assign, readonly) BOOL isDownloaded;

+ (instancetype)dataWithUid:(NSUInteger)uid name:(NSString*)name country:(NSString*)country;
- (instancetype)initWithUid:(NSUInteger)uid name:(NSString*)name country:(NSString*)country;

@end


#import "WeatherAPIClient.h"
@interface WeatherCity(APIClient)

- (void)reloadCurrentWeatherData;
- (void)reloadCurrentWeatherDataWithCompletion:(void (^)(CurrentWeatherData *weather, NSError *error))block;

@end
