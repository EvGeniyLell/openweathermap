//
//  ViewController.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"
#import "WeatherCity.h"

static NSTimeInterval const ScheduledUpdateTimeInterval = 1800;


@interface ViewController() <SettingsViewControllerProtocol>

@property (nonatomic, strong) NSArray<WeatherCity*>* citiesList;
@property (nonatomic, strong) NSTimer *scheduledUpdate;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(openSettings:)];
    self.navigationItem.rightBarButtonItem = settingsButton;

    self.title = @"Weather";
    
    self.citiesList = [[self class] makeCitiesList];
    
    [self selectCityByUserDefaults];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSArray<WeatherCity*>*)makeCitiesList {
    return @[
             [WeatherCity dataWithUid:703448 name:@"Kiev" country:@"UA"],
             //{"_id":703448,"name":"Kiev","country":"UA","coord":{"lon":30.516666,"lat":50.433334}}
             [WeatherCity dataWithUid:696317 name:@"Pridneprovsk" country:@"UA"],
             //{"_id":696317,"name":"Pridneprovsk","country":"UA","coord":{"lon":35.116669,"lat":48.400002}}
             [WeatherCity dataWithUid:706483 name:@"Kharkiv" country:@"UA"],
             //{"_id":706483,"name":"Kharkiv","country":"UA","coord":{"lon":36.25,"lat":50}}
             [WeatherCity dataWithUid:687700 name:@"Zaporizhzhya" country:@"UA"],
             //{"_id":687700,"name":"Zaporizhzhya","country":"UA","coord":{"lon":35.183331,"lat":47.816669}}
//             [WeatherCity dataWithUid:777700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
//             [WeatherCity dataWithUid:687700 name:@"-" country:@"UA"],
             ];
    
}

#pragma mark - Segues
- (void)openSettings:(id)sender {
    SettingsViewController *setingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    setingsViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    setingsViewController.delegate = self;
    setingsViewController.citiesList = self.citiesList;
    [self.navigationController pushViewController:setingsViewController animated:YES];
}

#pragma mark - SettingsViewControllerProtocol
- (void)settingsViewController:(SettingsViewController*)controller didSelectedCity:(WeatherCity*)city {
    [self setCity:city];
    [self.navigationController popToViewController:self animated:YES];
}

- (void)setCity:(WeatherCity*)city {
    [city reloadCurrentWeatherData];
    [self.weatherView setCity:city];
    [self saveToUserDefaults];
    [self makeScheduledUpdate];
}

@end


#import "NSUserDefaults+KeyedArchiver.h"
@implementation ViewController(NSUserDefaults)

+ (NSString*)userDefaultsKey {
    return [NSString stringWithFormat:@"selectedCityID"];
}

- (void)saveToUserDefaults {
    [NSUserDefaults saveObject:[NSNumber numberWithUnsignedInteger:self.weatherView.city.uid] forKey:[self class].userDefaultsKey];
}

+ (NSUInteger)loadFromUserDefaults {
    NSUInteger uid = [[NSUserDefaults loadObjectForKey:self.userDefaultsKey] unsignedIntegerValue];
    return uid;
}

- (NSUInteger)loadFromUserDefaults {
    return [[self class] loadFromUserDefaults];
}

- (void)selectCityByUserDefaults {
    NSUInteger uid = [self loadFromUserDefaults];
    for (WeatherCity *city in self.citiesList) {
        if (city.uid == uid) {
            [self setCity:city];
            return;
        }
    }
    [self setCity:[self.citiesList objectAtIndex:0]];
}

+ (void)backgroundUpdate {
    NSUInteger uid = [self loadFromUserDefaults];
    NSArray *citiesList = [self makeCitiesList];
    for (WeatherCity *city in citiesList) {
        if (city.uid == uid) {
            [city reloadCurrentWeatherData];
            return;
        }
    }
}

@end


@implementation ViewController(ScheduledUpdate)

- (void)makeScheduledUpdate {
    [self.scheduledUpdate invalidate];
    self.scheduledUpdate = [NSTimer scheduledTimerWithTimeInterval:ScheduledUpdateTimeInterval target:self selector:@selector(scheduledUpdateInvoke:) userInfo:nil repeats:NO];
}

- (void)scheduledUpdateInvoke:(NSTimer*)timer {
    [self.weatherView.city reloadCurrentWeatherData];
    [self makeScheduledUpdate];
}

@end

