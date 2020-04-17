//
//  ModuleFactory.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "ModuleFactory.h"

@implementation ModuleFactory

-(WeatherViewController *) createWeatherViewModule {
    WeatherViewController *viewController = [[WeatherViewController alloc]initWithNibName:@"WeatherViewController" bundle:nil];
    return viewController;
}

@end
