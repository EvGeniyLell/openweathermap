//
//  ViewController.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet WeatherView *weatherView;

@end


@interface ViewController(NSUserDefaults)

- (void)saveToUserDefaults;
- (void)selectCityByUserDefaults;
+ (void)backgroundUpdate;

@end


@interface ViewController(ScheduledUpdate)

- (void)makeScheduledUpdate;

@end

