//
//  WeatherCoordinator.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherCoordinator.h"

@interface WeatherCoordinator ()

@property (nonatomic) WeatherViewController *weatherViewController;

@end

@implementation WeatherCoordinator

@synthesize appContext;
@synthesize navigationController;

+ (instancetype)weatherCoordinatorWithAppContext:(id<AppContextType>)appContext {
    WeatherCoordinator *weatherCoordinator = [WeatherCoordinator new];
    weatherCoordinator.navigationController = appContext.navigationController;
    weatherCoordinator.appContext = appContext;
    return weatherCoordinator;
}


- (void)start {
    self.weatherViewController = [self.appContext.moduleFactory createWeatherViewModuleWithWeatherManager: self.appContext.weatherManager];
    [self.navigationController pushViewController: self.weatherViewController animated: YES];
}

- (void)stop {
    [navigationController popViewControllerAnimated: YES];
    self.weatherViewController = nil;
}


@end
