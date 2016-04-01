//
//  MainWeather.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "MainWeather.h"


@interface MainWeather()

@property (nonatomic, assign) CGFloat temperature;
@property (nonatomic, assign) CGFloat temperatureMax;
@property (nonatomic, assign) CGFloat temperatureMin;
@property (nonatomic, assign) CGFloat pressure;
@property (nonatomic, assign) NSInteger humidity;

@end


@implementation MainWeather

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        self.temperature = [[attributes valueForKeyPath:@"temp"] doubleValue];
        self.temperatureMax = [[attributes valueForKeyPath:@"temp_max"] doubleValue];
        self.temperatureMin = [[attributes valueForKeyPath:@"temp_min"] doubleValue];
        self.pressure = [[attributes valueForKeyPath:@"pressure"] doubleValue];
        self.humidity = [[attributes valueForKeyPath:@"humidity"] integerValue];
    }
    return self;
}

@end


@implementation MainWeather (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithDouble:self.temperature] forKey:@"temperature"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.temperatureMax] forKey:@"temperatureMax"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.temperatureMin] forKey:@"temperatureMin"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.pressure] forKey:@"pressure"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.humidity] forKey:@"humidity"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.temperature = [[aDecoder decodeObjectForKey:@"temperature"] doubleValue];
        self.temperatureMax = [[aDecoder decodeObjectForKey:@"temperatureMax"] doubleValue];
        self.temperatureMin = [[aDecoder decodeObjectForKey:@"temperatureMin"] doubleValue];
        self.pressure = [[aDecoder decodeObjectForKey:@"pressure"] doubleValue];
        self.humidity = [[aDecoder decodeObjectForKey:@"humidity"] integerValue];
    }
    return self;
}

@end

