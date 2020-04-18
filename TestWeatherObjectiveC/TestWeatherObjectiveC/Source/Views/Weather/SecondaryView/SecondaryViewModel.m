//
//  SecondaryViewModel.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "SecondaryViewModel.h"
#import "WeatherCoordinatorState.h"

@implementation SecondaryViewModel

@synthesize viewController;

- (instancetype)initWithViewControllerDelegate: (id<SecondaryViewControllerDelegate>) viewController {
    self = [super init];
    if (self) {
        self.viewController = viewController;
    }
    return self;
}

//MARK: - SecondaryViewModelDelegate
- (void)viewLoaded {
    [self notifyEvent: secondaryViewPresented];
}

-(void) goBackButtonTapped {
    [self notifyEvent: goBackButtonTapped];
}

-(NSString *) goBackButtonTitle {
    return @"Go Back!";
}

//MARK: - Private methods
-(void) notifyEvent: (WeatherCoordinatorEvent) event {
    NSNumber *numberEvent = [NSNumber numberWithInt: (int)event];
    NSDictionary *userInfo = @{ @"event": numberEvent };
    [[NSNotificationCenter defaultCenter] postNotificationName: @"UpdateWeatherCoordinatorStateMachine" object:nil userInfo:userInfo];
}

@end
