//
//  ModuleFactory.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewHeaders.h"

@interface ModuleFactory : NSObject

-(WeatherViewController *) createWeatherViewModule;

@end
