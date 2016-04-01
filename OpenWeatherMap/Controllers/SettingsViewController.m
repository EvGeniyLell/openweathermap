//
//  SettingsViewController.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "SettingsViewController.h"
#import "CityCell.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.citiesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityCell *cityCell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    WeatherCity *city = [self.citiesList objectAtIndex:indexPath.row];
    [cityCell setCity:city];
    return cityCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate) {
        WeatherCity *city = [self.citiesList objectAtIndex:indexPath.row];
        [self.delegate settingsViewController:self didSelectedCity:city];
    }
}

#pragma mark - Property
- (void)setCitiesList:(NSArray<WeatherCity *> *)citiesList {
    if (_citiesList != citiesList) {
        _citiesList = citiesList;
        [self updateView];
    }
}

#pragma mark - Configure
- (void)updateView {
    // Update the user interface for the detail item.
    if (self.citiesList) {
        [self.tableView reloadData];
    }
}


@end
