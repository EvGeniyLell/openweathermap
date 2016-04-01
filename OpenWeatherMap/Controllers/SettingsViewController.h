//
//  SettingsViewController.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherCity.h"

@class SettingsViewController;
@protocol SettingsViewControllerProtocol <NSObject>
@required

- (void)settingsViewController:(SettingsViewController*)controller didSelectedCity:(WeatherCity*)city;


@end

@interface SettingsViewController : UIViewController

@property (nonatomic, weak) id<SettingsViewControllerProtocol> delegate;
@property (nonatomic, strong) NSArray<WeatherCity*>* citiesList;

@end
