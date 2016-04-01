//
//  ViewController.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "ViewController.h"
#import "WeatherCity.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(openSettings:)];
    self.navigationItem.rightBarButtonItem = settingsButton;

    self.title = @"Weather";
    
    WeatherCity *test = [WeatherCity dataWithUid:694165 name:@"Dnepropetrovsk" country:@"UA"];
    [test reloadCurrentWeatherData];
    self.weatherView.city = test;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)citiesList {
    [WeatherCity dataWithUid:694166 name:@"Kiev" country:@"UA"];
    [WeatherCity dataWithUid:694165 name:@"Dnepropetrovsk" country:@"UA"];
    [WeatherCity dataWithUid:694164 name:@"Kharkiv" country:@"UA"];
    [WeatherCity dataWithUid:694163 name:@"Zaporozhye" country:@"UA"];
    
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        Book *book = [self.library bookAtIndex:indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setBook:book];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//    }
}

- (void)openSettings:(id)sender {
    NSLog(@"%@",self.storyboard);
    
    UIViewController *setingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    setingsViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:setingsViewController animated:YES completion:NULL];
//    switch (self.sortLibraryType) {
//        case SortLibraryByName:
//            self.sortLibraryType = SortLibraryByRating;
//            break;
//        case SortLibraryByRating:
//            self.sortLibraryType = SortLibraryByName;
//            break;
//        default:
//            self.sortLibraryType = SortLibraryByName;
//            break;
//    }
}

@end
