//
//  AppCoordinator.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "AppCoordinator.h"
#import "WeatherCoordinator.h"

@interface AppCoordinator ()

@property (nonatomic, retain) WeatherCoordinator *weatherCoordinator;

@end

@implementation AppCoordinator

@synthesize appContext;
@synthesize navigationController;

+ (instancetype)appCoordinatorWithAppContext:(id<AppContextType>) appContext { 
    AppCoordinator *appCoordinator = [AppCoordinator new];
    appCoordinator.navigationController = appContext.navigationController;
    appCoordinator.appContext = appContext;
    return appCoordinator;
}

- (void)start {
    self.weatherCoordinator = [[WeatherCoordinator alloc] initWeatherCoordinatorWithAppContext: self.appContext];
    [self.weatherCoordinator start];
}

- (void)stop {
    //TODO:
}

@end
