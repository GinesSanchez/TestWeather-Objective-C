//
//  WeatherViewModel.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherViewProtocolContracts.h"
#import "WeatherManagerType.h"

@protocol WeatherViewModelType <NSObject>

@property (nonatomic, weak) id <WeatherViewControllerDelegate> viewController;

-(instancetype) initWithViewControllerDelegate: (id <WeatherViewControllerDelegate>) viewController
                                    weatherManager: (id <WeatherManagerType>) weatherManager;

@end


@interface WeatherViewModel : NSObject <WeatherViewModelType, WeatherViewModelDelegate>

@end

