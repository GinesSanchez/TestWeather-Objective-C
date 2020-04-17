//
//  WeatherManager.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherManagerType.h"
#import "NetworkManagerType.h"

@interface WeatherManager: NSObject <WeatherManagerType>

@property (nonatomic) id <NetworkManagerType> networkManager;

+(instancetype) weatherManagerWithNetworkManager;
-(void) getInformationFromCity: (NSString *) city units: (NSString *) units completionHandler: (getCityInfo) completion;
-(void) getInformationInCelsiusFromCity: (NSString *) city completionHandler: (getCityInfo) completion;

@end
