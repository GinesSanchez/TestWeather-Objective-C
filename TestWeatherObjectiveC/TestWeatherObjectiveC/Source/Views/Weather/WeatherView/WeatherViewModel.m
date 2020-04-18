//
//  WeatherViewModel.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherViewModel.h"
#import "ViewModelState.h"
#import "WeatherCoordinatorState.h"

@interface WeatherViewModel ()

@property (nonatomic) id <WeatherManagerType> weatherManager;
@property (nonatomic) ViewModelState viewModelState;
@property (nonatomic) CityInfo * cityInfo;
@property (nonatomic) NSError * requestError;

@end


@implementation WeatherViewModel

@synthesize viewController;

- (instancetype)initWithViewControllerDelegate:(id<WeatherViewControllerDelegate>)viewController weatherManager: (id<WeatherManagerType>) weatherManager {
    self = [super init];

    if (self) {
        self.viewController = viewController;
        self.weatherManager = weatherManager;
        self.viewModelState = loading;
        self.cityInfo = nil;
        self.requestError = nil;
    }
    return self;
}

//MARK: - didSet
-(void) setViewModelState:(ViewModelState) viewModelState {
    _viewModelState = viewModelState;
    [self.viewController viewModelStateUpdated];
}

-(void) setCityInfo:(CityInfo *)cityInfo {
    _cityInfo = cityInfo;
    self.viewModelState = ready;
}

-(void) setRequestError:(NSError *) requestError {
    _requestError = requestError;
    self.viewModelState = stateError;
}


//MARK: - WeatherViewModelDelegate
- (void) viewLoaded {
    [self notifyEvent: weatherViewPresented];
    [self getCityInformation];
}

-(void) tapMeButtonTapped {
    [self notifyEvent: tapMeButtonTapped];
}

-(NSString *) titleText {
    return @"Weather App";
}

-(NSString *) tapMeButtonTitle {
    return @"Tap Me!";
}

-(NSString *) cityWeatherInfo {
    switch (self.viewModelState) {
        case loading:
            return @"Loading...";
        case ready:
            return [NSString stringWithFormat: @"%@ temperature: %@ Cº", @"Cartagena", self.cityInfo.currentTemp];
        case stateError:
            return @"There was an error getting the temperature information";
        default:
            return @"Not available";
    }
}

//MARK: - Private methods
-(void) getCityInformation {
    self.viewModelState = loading;
    [self.weatherManager getInformationInCelsiusFromCity:@"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        if (cityInfo) {
            self.cityInfo = cityInfo;
        } else {            
            self.requestError = error;
        }
    }];
}

-(void) notifyEvent: (WeatherCoordinatorEvent) event {
    NSNumber *numberEvent = [NSNumber numberWithInt: (int)event];
    NSDictionary *userInfo = @{ kEvent: numberEvent };
    [[NSNotificationCenter defaultCenter] postNotificationName: kUpdateEvent object:nil userInfo:userInfo];
}

@end
