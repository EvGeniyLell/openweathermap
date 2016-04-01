//
//  WeatherCondition.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//
//  http://openweathermap.org/weather-conditions

#import "WeatherCondition.h"


@interface WeatherCondition()

@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, assign) WeatherConditionMainOptions main;
@property (nonatomic, strong) NSString *descript;

@end


@implementation WeatherCondition

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        self.uid = [[attributes valueForKeyPath:@"id"] unsignedIntegerValue];
        self.main = [self mainFromString:[attributes valueForKeyPath:@"main"]];
        self.descript = [attributes valueForKeyPath:@"description"];
    }
    return self;
}

- (WeatherConditionMainOptions)mainFromString:(NSString*)string {
    if (string.length == 0) { /*none*/ }
    else if (NSOrderedSame == [string compare:@"Thunderstorm" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainThunderstorm;
    }
    else if (NSOrderedSame == [string compare:@"Drizzle" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainDrizzle;
    }
    else if (NSOrderedSame == [string compare:@"Rain" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainRain;
    }
    else if (NSOrderedSame == [string compare:@"Snow" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainSnow;
    }
    else if (NSOrderedSame == [string compare:@"Atmosphere" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainAtmosphere;
    }
    else if (NSOrderedSame == [string compare:@"Clear" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainClear;
    }
    else if (NSOrderedSame == [string compare:@"Clouds" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainClouds;
    }
    else if (NSOrderedSame == [string compare:@"Extreme" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainExtreme;
    }
    else if (NSOrderedSame == [string compare:@"Mist" options:NSCaseInsensitiveSearch]) {
        return WeatherConditionMainMist;
    }
    
    return WeatherConditionMainUnknown;
    
}

@end


@implementation WeatherCondition (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.uid] forKey:@"uid"];
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.main] forKey:@"main"];
    [aCoder encodeObject:self.descript forKey:@"descript"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.uid = [[aDecoder decodeObjectForKey:@"uid"] unsignedIntegerValue];
        self.main = [[aDecoder decodeObjectForKey:@"main"] unsignedIntegerValue];
        self.descript = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

@end
