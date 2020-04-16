//
//  NSError+WeatherManager.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrorCaseType) {
    ErrorCaseTypeUnknownError,
    ErrorCaseTypeUnknownApiError,
    ErrorCaseTypeInvalidApiKey,
    ErrorCaseTypeInternalError,
    ErrorCaseTypeCityNotFound,
    ErrorCaseTypeNoInternetConnection
};

@interface NSError (WeatherManager)

+(instancetype) errorFromWeatherManagerErrorType: (ErrorCaseType) errorCaseType;

@end

