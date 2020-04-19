//
//  WeatherCoordinatorState.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "StateMachineConstants.h"

typedef NS_ENUM(NSInteger, WeatherCoordinatorState) {
    init,
    start,
    presentingWeatherView,
    tappingTapMeButton,
    presentingSecondaryView,
    tappingGoBackButton,
    stop
};

typedef NS_ENUM(NSInteger, WeatherCoordinatorEvent) {
    initiated,
    started,
    weatherViewPresented,
    tapMeButtonTapped,
    secondaryViewPresented,
    goBackButtonTapped,
    stopped
};
