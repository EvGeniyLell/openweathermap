//
//  SunCondition.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "SunCondition.h"

@interface SunCondition()

@property (nonatomic, assign) NSTimeInterval sunrise;
@property (nonatomic, assign) NSTimeInterval sunset;

@end


@implementation SunCondition

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        self.sunrise = [[attributes valueForKeyPath:@"sunrise"] doubleValue];
        self.sunset = [[attributes valueForKeyPath:@"sunset"] doubleValue];
    }
    return self;
}

@end

@implementation SunCondition (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithDouble:self.sunrise] forKey:@"sunrise"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.sunset] forKey:@"sunset"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.sunrise = [[aDecoder decodeObjectForKey:@"sunrise"] doubleValue];
        self.sunset = [[aDecoder decodeObjectForKey:@"sunset"] doubleValue];
    }
    return self;
}

@end
