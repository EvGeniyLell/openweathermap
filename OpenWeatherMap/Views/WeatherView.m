//
//  WeatherView.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "WeatherView.h"


@interface WeatherView()

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureMinLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureMaxLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunrisesetLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastupdateLabel;

@end


@implementation WeatherView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityDataDidChanged:) name:WeatherCityNotificationDataDidChanged object:nil];

    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:WeatherCityNotificationDataDidChanged object:nil];
}


#pragma mark - Property
- (void)setCity:(WeatherCity *)city {
    if (_city != city) {
        _city = city;
        [self updateView];
    }
}

#pragma mark - Update
- (void)updateView {
    self.cityNameLabel.text = self.city.name;
    CurrentWeatherData *data = self.city.currentWeather;
    if (data) {
        self.coverView.image = [self imageFromWeatherConditionMainOptions:data.weather.main];
        self.descriptionLabel.text = data.weather.descript;

        self.temperatureLabel.text = [NSString stringWithFormat:@"%+.0f", [self celsiyFromFaringeyt:data.main.temperature]];
        // temperature Max/Min show if it different
        if (data.main.temperatureMax != data.main.temperatureMin) {
            self.temperatureMaxLabel.text = [NSString stringWithFormat:@"%+.0f", [self celsiyFromFaringeyt:data.main.temperatureMax]];
            self.temperatureMinLabel.text = [NSString stringWithFormat:@"%+.0f", data.main.temperatureMin];
        } else {
            self.temperatureMaxLabel.text = @"";
            self.temperatureMinLabel.text = @"";
        }
        self.pressureLabel.text = [NSString stringWithFormat:@"%.0f hPA", data.main.pressure];
        self.humidityLabel.text = [NSString stringWithFormat:@"%ld %%", (long)data.main.humidity];

        // show wind direction if it has
        if (data.wind.direction != WindtConditionDirectionUnknown) {
            self.windLabel.text = [NSString stringWithFormat:@"speed: %.0f\ndirect: %@", data.wind.speed, [self stringFromWindtConditionDirectionOptions:data.wind.direction]];
        } else {
            self.windLabel.text = [NSString stringWithFormat:@"speed: %.0f", data.wind.speed];
        }
        
        self.sunrisesetLabel.text = [NSString stringWithFormat:@"↑ %@\n%@ ↓", [self stringFromTimeInterval:data.sun.sunrise], [self stringFromTimeInterval:data.sun.sunset]];
        self.lastupdateLabel.text = [NSString stringWithFormat:@"update from server: %@",
        [self stringFromTimeIntervalAsDate:data.lastUpdate]];
    } else {
        self.coverView.image = [self imageFromWeatherConditionMainOptions:WeatherConditionMainUnknown];
        self.descriptionLabel.text = @"";
        self.temperatureLabel.text = @"+/-";
        self.temperatureMaxLabel.text = @"";
        self.temperatureMinLabel.text = @"";
        self.pressureLabel.text = @"hPA";
        self.humidityLabel.text = @"%%%%";
        self.windLabel.text = @"";
        self.sunrisesetLabel.text = @"";
        self.lastupdateLabel.text = @"update from server: never";
    }
}

#pragma mark - Transform
- (CGFloat)celsiyFromFaringeyt:(CGFloat)faringeyt {
    return faringeyt;
//    return (5.0/9.0)*(faringeyt-32.0);
}

- (UIImage*)imageFromWeatherConditionMainOptions:(WeatherConditionMainOptions)options {
    switch (options) {
        case WeatherConditionMainUnknown:
            return [UIImage imageNamed:@"MainOptionsNA"];
        case WeatherConditionMainThunderstorm:
            return [UIImage imageNamed:@"MainOptionsThunderstorm"];
        case WeatherConditionMainDrizzle:
            return [UIImage imageNamed:@"MainOptionsDrizzle"];
        case WeatherConditionMainRain:
            return [UIImage imageNamed:@"MainOptionsRain"];
        case WeatherConditionMainSnow:
            return [UIImage imageNamed:@"MainOptionsSnow"];
        case WeatherConditionMainAtmosphere:
            return [UIImage imageNamed:@"MainOptionsAtmosphere"];
        case WeatherConditionMainClear:
            return [UIImage imageNamed:@"MainOptionsClear"];
        case WeatherConditionMainClouds:
            return [UIImage imageNamed:@"MainOptionsClouds"];
        case WeatherConditionMainExtreme:
            return [UIImage imageNamed:@"MainOptionsExtreme"];
        case WeatherConditionMainAdditional:
            return [UIImage imageNamed:@"MainOptionsAdditional"];
        case WeatherConditionMainMist:
            return [UIImage imageNamed:@"MainOptionsMist"];
            
    }
    return [UIImage imageNamed:@"MainOptionsNA"];
}

- (NSString*)stringFromWindtConditionDirectionOptions:(WindtConditionDirectionOptions)options {
    switch (options) {
            case WindtConditionDirectionUnknown:
                return @"";
            case WindtConditionDirectionSouth:
                return @"S";
            case WindtConditionDirectionSouthWest:
                return @"SW";
            case WindtConditionDirectionWest:
                return @"W";
            case WindtConditionDirectionWestNort:
                return @"WN";
            case WindtConditionDirectionNorth:
                return @"N";
            case WindtConditionDirectionNorthEast:
                return @"NE";
            case WindtConditionDirectionEast:
                return @"E";
            case WindtConditionDirectionEastSouth:
                return @"ES";
    }
    return @"";
}

- (NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}

- (NSString*)stringFromTimeIntervalAsDate:(NSTimeInterval)timeInterval {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}


#pragma mark - NSNotification
- (void)cityDataDidChanged:(NSNotification*)notification {
    if (notification.object == self.city) {
        [self updateView];
    }
}

@end
