//
//  NavigationViewController.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 01.04.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "NavigationViewController.h"


@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor redColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

@end
