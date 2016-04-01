//
//  WeatherView.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentWeatherData.h"
#import "WeatherCity.h"

@interface WeatherView : UIView

//@property (nonatomic, strong) CurrentWeatherData *data;
@property (nonatomic, strong) WeatherCity *city;

@end
