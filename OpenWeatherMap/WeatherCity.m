//
//  WeatherCity.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "WeatherCity.h"

static NSString * const WeatherCityNotificationDataDidChanged = @"WeatherCityNotificationDataDidChanged";

@interface WeatherCity()

@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong) CurrentWeatherData *currentWeather;

@end


@implementation WeatherCity

+ (instancetype)dataWithUid:(NSUInteger)uid name:(NSString*)name country:(NSString*)country {
    return [[self alloc] initWithUid:uid name:name country:country];
}

- (instancetype)initWithUid:(NSUInteger)uid name:(NSString*)name country:(NSString*)country {
    self = [super init];
    if (self) {
        self.uid = uid;
        self.name = name;
        self.country = country;
    }
    return self;
}

@end


#import "NSUserDefaults+KeyedArchiver.h"
@implementation WeatherCity(NSUserDefaults)

- (NSString*)userDefaultsKey {
    return [NSString stringWithFormat:@"currentWeatherByCityID%lu",(unsigned long)self.uid];
}

- (void)saveToUserDefaults {
    [NSUserDefaults saveObject:self.currentWeather forKey:self.userDefaultsKey];
}

- (id)loadFromUserDefaults {
    return [NSUserDefaults loadObjectForKey:self.userDefaultsKey];
}

@end


@implementation WeatherCity(APIClient)

- (void)reloadCurrentWeatherData {
// попробовать загрузить с кеша (юзер деф)
// если нету или время просрочено загрузить с сети (10мин)
// если загрузка из сети не удалась показыть старые данные
    
    if (self.currentWeather == nil) {
        self.currentWeather = [self loadFromUserDefaults];
    }
    
    NSTimeInterval curent = [NSDate date].timeIntervalSinceReferenceDate;
    if ((self.currentWeather.lastUpdate - curent) < 100 // 10 minuts
        || self.currentWeather == nil) {
        [self reloadCurrentWeatherDataWithApiClient:[WeatherAPIClient sharedClient] withBlock:^(CurrentWeatherData *weather, NSError *error) {
            self.currentWeather = weather;
            [[NSNotificationCenter defaultCenter] postNotificationName:WeatherCityNotificationDataDidChanged object:self];
            //
        }];
    }
}

- (void)reloadCurrentWeatherDataWithApiClient:(WeatherAPIClient*)client withBlock:(void (^)(CurrentWeatherData *weather, NSError *error))block  {
    [client GET:@"weather" parameters:@{@"id": [NSNumber numberWithUnsignedInteger:self.uid]} progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
            CurrentWeatherData *weather = [CurrentWeatherData dataWithAttributes:JSON];
            if (block) {
                block(weather,nil);
            }
//            if (weather) {
//                self.currentWeather = weather;
//            }
//            self.currentWeather.lastUpdate = [NSDate date].timeIntervalSinceReferenceDate;
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code
            if (block) {
                block(nil,error);
            }
            //
        }];
}



@end