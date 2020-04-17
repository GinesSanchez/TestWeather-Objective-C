//
//  WeatherViewModel.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherViewModel.h"

@interface WeatherViewModel ()

@property (nonatomic) id <WeatherManagerType> weatherManager;

@end


@implementation WeatherViewModel

@synthesize viewController;

- (instancetype)initWithViewControllerDelegate:(id<WeatherViewControllerDelegate>)viewController weatherManager: (id<WeatherManagerType>) weatherManager {
    self = [super init];

    if (self) {
        self.viewController = viewController;
        self.weatherManager = weatherManager;
    }
    return self;
}

@end
