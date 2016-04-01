//
//  CityCell.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherCity.h"

@interface CityCell : UITableViewCell

@property (nonatomic, strong) WeatherCity *city;

@end
