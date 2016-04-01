//
//  BaseWeatherData.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "BaseWeatherData.h"

@implementation BaseWeatherData

+ (instancetype)dataWithAttributes:(id)attributes {
    return [[self alloc]initWithAttributes:attributes];
}

- (instancetype)initWithAttributes:(id)attributes {
    return nil; // virtual
}

@end


@implementation BaseWeatherData (NSCoding)

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
