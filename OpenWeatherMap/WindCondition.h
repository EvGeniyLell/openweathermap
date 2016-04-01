//
//  WindtCondition.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "BaseWeatherData.h"


typedef NS_OPTIONS(NSUInteger, WindtConditionDirectionOptions) {
    WindtConditionDirectionUnknown = 0,
    //South North West East
    WindtConditionDirectionSouth,
    WindtConditionDirectionSouthWest,
    WindtConditionDirectionWest,
    WindtConditionDirectionWestNort,
    WindtConditionDirectionNorth,
    WindtConditionDirectionNorthEast,
    WindtConditionDirectionEast,
    WindtConditionDirectionEastSouth,
};


@interface WindCondition : BaseWeatherData

@property (nonatomic, assign, readonly) CGFloat speed;
@property (nonatomic, assign, readonly) WindtConditionDirectionOptions direction;

@end
