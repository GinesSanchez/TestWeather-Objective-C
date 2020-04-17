//
//  WeatherViewController.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherViewProtocolContracts.h"

@interface WeatherViewController : UIViewController <WeatherViewControllerDelegate>

@property (nonatomic) id <WeatherViewModelDelegate> viewModel;

@end

