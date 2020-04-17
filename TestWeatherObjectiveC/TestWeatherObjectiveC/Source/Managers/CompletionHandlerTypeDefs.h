//
//  CompletionHandlerTypeDefs.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "CityInfo.h"

//MARK: - Network Manager
typedef void(^getJsonRequestBlock)(NSDictionary *response, NSError *error);

//MARK: - Weather Manager
typedef void(^getCityInfo)(CityInfo *cityInfo, NSError *error);
