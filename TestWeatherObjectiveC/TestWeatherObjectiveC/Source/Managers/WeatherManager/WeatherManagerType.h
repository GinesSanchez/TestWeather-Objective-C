//
//  WeatherManagerType.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "CompletionHandlerTypeDefs.h"

@protocol WeatherManagerType <NSObject>

@property (nonatomic) id <NetworkManagerType> networkManager;

/// Retrives Current Temperature of a city
///
/// - Parameter
///     - city: Name of the city.
///     - units: Fahrenheit = imperial. Celsius = metric. Temperature in Kelvin is used by default
///     - completionHandler: will be triggred when the request is done. If it is successful, returns the temperature of the city in interger format. Error will be nil if successful. If there is an error, and weather app error type is returned, and dictionary will be nil.
-(void) getInformationFromCity: (NSString *) city units: (NSString *) units completionHandler: (getCityInfo) completion;

/// Retrives Current Temperature of a city in Celsius
///
/// - Parameter
///     - city: Name of the city.
///     - completionHandler: will be triggred when the request is done. If it is successful, returns the temperature of the city in Celsisu in interger format. Error will be nil if successful. If there is an error, and weather app error type is returned, and dictionary will be nil.
-(void) getInformationInCelsiusFromCity: (NSString *) city completionHandler: (getCityInfo) completion;

@end

