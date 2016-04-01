//
//  SunCondition.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "BaseWeatherData.h"

@interface SunCondition : BaseWeatherData

@property (nonatomic, assign, readonly) NSTimeInterval sunrise;
@property (nonatomic, assign, readonly) NSTimeInterval sunset;

@end
