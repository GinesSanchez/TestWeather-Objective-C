//
//  WeatherCoordinatorState.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

typedef NS_ENUM(NSInteger, WeatherCoordinatorState) {
    none,
    start,
    presentingWeatherView,
    tappingTapMeButton,
    stop
};

typedef NS_ENUM(NSInteger, WeatherCoordinatorEvent) {
    noned,
    started,
    weatherViewPresented,
    tapMeButtonTapped,
    stopped
};
