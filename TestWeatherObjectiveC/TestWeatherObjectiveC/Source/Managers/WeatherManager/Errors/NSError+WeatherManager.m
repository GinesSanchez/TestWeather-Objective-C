//
//  NSError+WeatherManager.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "NSError+WeatherManager.h"

@implementation NSError (WeatherManager)

+(instancetype) errorFromWeatherManagerErrorType: (ErrorCaseType) errorCaseType {
    NSInteger code;
    NSString *errorDescription;
    switch (errorCaseType) {
        case ErrorCaseTypeUnknownError:
            code = ErrorCaseTypeUnknownError;
            errorDescription = @"Uknown Error from the request.";
            break;
        case ErrorCaseTypeUnknownApiError:
            code = ErrorCaseTypeUnknownApiError;
            errorDescription = @"Unknown Api Error.";
            break;
        case ErrorCaseTypeInvalidApiKey:
            code = ErrorCaseTypeInvalidApiKey;
            errorDescription = @"Invalid API Key.";
            break;
        case ErrorCaseTypeInternalError:
            code = ErrorCaseTypeInternalError;
            errorDescription = @"Internal Error. E.g. wrong url call.";
            break;
        case ErrorCaseTypeCityNotFound:
            code = ErrorCaseTypeCityNotFound;
            errorDescription = @"City not found in the API data system.";
            break;
        case ErrorCaseTypeNoInternetConnection:
            code = ErrorCaseTypeNoInternetConnection;
            errorDescription = @"There is not internet connection.";
            break;
    }

    return [NSError errorWithDomain: @"com.testWeather.objective-c"
                               code: code
                           userInfo:@{NSLocalizedDescriptionKey : errorDescription}];
}

@end
