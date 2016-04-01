//
//  WindtCondition.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "WindCondition.h"


@interface WindCondition()

@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) WindtConditionDirectionOptions direction;

@end


@implementation WindCondition

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        self.speed = [[attributes valueForKeyPath:@"speed"] doubleValue];
        NSNumber *degrees = [attributes valueForKeyPath:@"deg"];
        if (degrees) {
            self.direction = [self directionFromMeteorologicalDegrees:([degrees unsignedIntegerValue])];
        } else {
            self.direction = WindtConditionDirectionUnknown;
        }
    }
    return self;
}


- (WindtConditionDirectionOptions)directionFromMeteorologicalDegrees:(NSUInteger)degrees {
    if      (degrees < 45*1) {
        return WindtConditionDirectionSouth;
    }
    else if (degrees < 45*2) {
        return WindtConditionDirectionSouthWest;
    }
    else if (degrees < 45*3) {
        return WindtConditionDirectionWest;
    }
    else if (degrees < 45*4) {
        return WindtConditionDirectionWestNort;
    }
    else if (degrees < 45*5) {
        return WindtConditionDirectionNorth;
    }
    else if (degrees < 45*6) {
        return WindtConditionDirectionNorthEast;
    }
    else if (degrees < 45*7) {
        return WindtConditionDirectionEast;
    }
    else if (degrees < 45*8) {
        return WindtConditionDirectionEastSouth;
    }
    return WindtConditionDirectionUnknown;
}

@end


@implementation WindCondition (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithDouble:self.speed] forKey:@"speed"];
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.direction] forKey:@"direction"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.speed = [[aDecoder decodeObjectForKey:@"speed"] doubleValue];
        self.direction = [[aDecoder decodeObjectForKey:@"direction"] unsignedIntegerValue];
    }
    return self;
}

@end
