//
//  CurrentWeatherData.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "CurrentWeatherData.h"


@interface CurrentWeatherData()

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) WeatherCondition * weather;
@property (nonatomic, strong) MainWeather * main;
@property (nonatomic, strong) WindCondition * wind;
@property (nonatomic, strong) SunCondition * sun;

@property (nonatomic, assign) NSTimeInterval lastUpdate;

@end


@implementation CurrentWeatherData

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        NSDictionary *rawCoord = attributes[@"coord"];
        self.coordinate = CLLocationCoordinate2DMake([rawCoord[@"lat"] doubleValue], [rawCoord[@"lon"] doubleValue]);
        self.weather = [WeatherCondition dataWithAttributes:[attributes[@"weather"] lastObject]];
        self.main = [MainWeather dataWithAttributes:attributes[@"main"]];
        self.wind = [WindCondition dataWithAttributes:attributes[@"wind"]];
        self.sun = [SunCondition dataWithAttributes:attributes[@"sys"]];
        
        self.lastUpdate = [NSDate date].timeIntervalSinceReferenceDate;
    }
    return self;
}

@end


@implementation CurrentWeatherData (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coordinate.latitude] forKey:@"latitude"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.coordinate.longitude] forKey:@"longitude"];
    [aCoder encodeObject:self.weather forKey:@"weather"];
    [aCoder encodeObject:self.main forKey:@"main"];
    [aCoder encodeObject:self.wind forKey:@"wind"];
    [aCoder encodeObject:self.sun forKey:@"sun"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.coordinate = CLLocationCoordinate2DMake([[aDecoder decodeObjectForKey:@"latitude"] doubleValue], [[aDecoder decodeObjectForKey:@"longitude"] doubleValue]);
        self.weather = [aDecoder decodeObjectForKey:@"weather"];
        self.main = [aDecoder decodeObjectForKey:@"main"];
        self.wind = [aDecoder decodeObjectForKey:@"wind"];
        self.sun = [aDecoder decodeObjectForKey:@"sun"];
    }
    return self;
}

@end
