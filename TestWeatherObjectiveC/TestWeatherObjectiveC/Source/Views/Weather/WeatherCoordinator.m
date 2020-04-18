//
//  WeatherCoordinator.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherCoordinator.h"
#import "WeatherCoordinatorState.h"

@interface WeatherCoordinator ()

@property (nonatomic) WeatherViewController *weatherViewController;
@property (nonatomic) SecondaryViewController *secondaryViewController;
@property (nonatomic) WeatherCoordinatorState state;
@property (nonatomic) WeatherCoordinatorEvent event;
@property (nonatomic) dispatch_queue_t serialQueue;

@end

@implementation WeatherCoordinator

@synthesize appContext;
@synthesize navigationController;

+ (instancetype)weatherCoordinatorWithAppContext:(id<AppContextType>)appContext {
    WeatherCoordinator *weatherCoordinator = [WeatherCoordinator new];

    weatherCoordinator.navigationController = appContext.navigationController;
    weatherCoordinator.appContext = appContext;
    weatherCoordinator.serialQueue = dispatch_queue_create("com.weatherExample.SerialQueue", NULL);
    weatherCoordinator.state = none;
    weatherCoordinator.event = none;

    [weatherCoordinator observeState];
    return weatherCoordinator;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: kUpdateEvent
                                                    object: nil];
}

- (void)start {
    self.event = started;
}

- (void)stop {
    self.event = stopped;
}

//MARK: - didSet
-(void) setState: (WeatherCoordinatorState)state {
    _state = state;
    [self setNextActionWithState: state];
}

-(void) setEvent: (WeatherCoordinatorEvent) event {
    _event = event;
    [self updateStateWithEvent: event];
}

//MARK: - State Machine
-(void) observeState {
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(updateEventWithNotification:)
                                                 name: kUpdateEvent
                                               object: nil];
}

-(void) updateEventWithNotification: (NSNotification*)notification {
    if ([[notification name] isEqualToString: kUpdateEvent]) {
        self.event = [notification.userInfo[kEvent] intValue];
    }
}

-(void) setNextActionWithState: (WeatherCoordinatorState) state {
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (self.state) {
            case none:
                break;
            case start: {
                self.weatherViewController = [self.appContext.moduleFactory createWeatherViewModuleWithWeatherManager: self.appContext.weatherManager];
                [self.navigationController pushViewController: self.weatherViewController animated: YES];
                break;
            }
            case presentingWeatherView:
                break;
            case tappingTapMeButton:
                self.secondaryViewController = [self.appContext.moduleFactory createSecondaryViewModule];
                [self.navigationController pushViewController: self.secondaryViewController animated: YES];
                break;
            case presentingSecondaryView:
                break;
            case tappingGoBackButton:
                [self.navigationController popViewControllerAnimated: YES];
                break;
            case stop: {
                [self.navigationController popViewControllerAnimated: YES];
                self.weatherViewController = nil;
                break;
            }
        }
    });
}

-(void) updateStateWithEvent: (WeatherCoordinatorEvent) event {
    __weak WeatherCoordinator *weakSelf = self;
    dispatch_sync(weakSelf.serialQueue, ^{
        switch (weakSelf.event) {
            case noned:
                break;
            case started:
                if (weakSelf.state == none) weakSelf.state = start;
                break;
            case weatherViewPresented:
                if (weakSelf.state == start || weakSelf.state == tappingGoBackButton) weakSelf.state = presentingWeatherView;
                break;
            case tapMeButtonTapped:
                if (weakSelf.state == presentingWeatherView) weakSelf.state = tappingTapMeButton;
                break;
            case secondaryViewPresented:
                if (weakSelf.state == tappingTapMeButton) weakSelf.state = presentingSecondaryView;
                break;
            case goBackButtonTapped:
                if (weakSelf.state == presentingSecondaryView) weakSelf.state = tappingGoBackButton;
                break;
            case stopped:
                self.state = stop;
                break;
        }
    });
}

@end
