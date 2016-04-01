//
//  CityCell.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "CityCell.h"


@interface CityCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@end


@implementation CityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Property
- (void)setCity:(WeatherCity *)city {
    if (_city != city) {
        _city = city;
        [self updateView];
    }
}

- (void)updateView {
    if (self.city) {
        self.nameLabel.text = self.city.name;
        self.countryLabel.text = self.city.country;
    } else {
        self.nameLabel.text = @"unset";
        self.countryLabel.text = @"--";
    }
}

@end
