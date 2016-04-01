//
//  BaseWeatherData.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h> // float

@interface BaseWeatherData : NSObject

+ (instancetype)dataWithAttributes:(id)attributes;
- (instancetype)initWithAttributes:(id)attributes;

@end
