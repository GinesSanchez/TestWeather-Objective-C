//
//  WeatherCoordinator.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinating.h"
#import "AppContext.h"
#import "WeatherCoordinatorState.h"

@protocol WeatherCoordinatorType <Coordinating>

@property (nonatomic) id<AppContextType> appContext;

+(instancetype) weatherCoordinatorWithAppContext: (id<AppContextType>) appContext;

@end

@interface WeatherCoordinator : NSObject <WeatherCoordinatorType>

@property (nonatomic, retain) WeatherViewController *weatherViewController;
@property (nonatomic, retain) SecondaryViewController *secondaryViewController;
@property (nonatomic) WeatherCoordinatorState state;
@property (nonatomic) WeatherCoordinatorEvent event;

@end


