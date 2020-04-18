//
//  ModuleFactory.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "ModuleFactory.h"

@implementation ModuleFactory

-(WeatherViewController *) createWeatherViewModuleWithWeatherManager: (id <WeatherManagerType>) weatherManager {
    WeatherViewController *viewController = [[WeatherViewController alloc]initWithNibName:@"WeatherViewController" bundle:nil];
    WeatherViewModel *viewModel = [[WeatherViewModel alloc] initWithViewControllerDelegate: viewController weatherManager: weatherManager];
    viewController.viewModel = viewModel;
    return viewController;
}

-(SecondaryViewController *) createSecondaryViewModule {
    SecondaryViewController *viewController = [[SecondaryViewController alloc]initWithNibName: @"SecondaryViewController" bundle:nil];
    SecondaryViewModel *viewModel = [[SecondaryViewModel alloc] initWithViewControllerDelegate: viewController];
    viewController.viewModel = viewModel;
    return viewController;
}

@end
