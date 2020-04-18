//
//  WeatherViewProtocolContracts.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WeatherViewModelDelegate <NSObject>

-(void) viewLoaded;
-(void) tapMeButtonTapped;
-(NSString *) titleText;
-(NSString *) tapMeButtonTitle;
-(NSString *) cityWeatherInfo;

@end

@protocol WeatherViewControllerDelegate <NSObject>
-(void) viewModelStateUpdated;
@end
