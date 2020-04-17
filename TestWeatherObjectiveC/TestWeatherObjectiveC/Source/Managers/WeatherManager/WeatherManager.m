//
//  WeatherManager.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherManager.h"
#import "NSError+WeatherManager.h"

@implementation WeatherManager

//TODO: Move to specific Manager (enum)
NSString * const cityKey = @"q";
NSString * const unitsKey = @"units";
NSString * const apiKey = @"APPID";
NSString * const apiKeyValue = @"13707c65904c020b88624e021a64524d";
NSString * const defaultUnitsValue = @"metric";

@synthesize networkManager;

+(instancetype) weatherManagerWithNetworkManager {
    WeatherManager *weatherManager = [WeatherManager new];
    if (weatherManager) {
        weatherManager.networkManager = [NetworkManager new];
        return weatherManager;
    }

    return nil;
}

-(void) getInformationFromCity: (NSString *) city units: (NSString *) units completionHandler: (getCityInfo) completion {
    NSURL *url = [networkManager createURLFromParameters: @{
        cityKey: city,
        apiKey: apiKeyValue,
        unitsKey: units
    }];

    [networkManager getJsonWith:url completionHandler: ^(NSDictionary *response, NSError *error) {
        if (response) {
            CityInfo *cityInfo = [[CityInfo alloc] initWithDictionary: response];
            if (cityInfo) {
                completion(cityInfo, nil);
            } else {
                //For some error the 'cod' is a int and for others is a string.
                NSNumber *errorCode = 0;
                if ([response[@"cod"] isKindOfClass: [NSString class]]) {
                    NSString *stringErrorCode = response[@"cod"];
                    errorCode = [NSNumber numberWithInt: [stringErrorCode intValue]];

                } else if ([response[@"cod"] isKindOfClass: [NSNumber class]]) {
                    errorCode = response[@"cod"];
                }

                //API Errors
                switch ([errorCode intValue]) {
                case 401:
                        completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeInvalidApiKey]);
                        break;
                case 404: {
                    NSString *apiMessage = response[@"message"];
                    if (apiMessage) {
                        if ([apiMessage isEqualToString: @"Internal error"]) {
                                completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeInternalError]);
                            } else if ([apiMessage isEqualToString: @"city not found"]) {
                                completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeCityNotFound]);
                            } else {
                                completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeUnknownApiError]);
                            }
                        }
                    break;
                }
                default:
                        completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeUnknownApiError]);
                        break;
                }

            }
        } else if (error && error.code == -1009) {
            completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeNoInternetConnection]);
        } else {
            completion(nil, [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeUnknownError]);
        }
    }];
}

-(void) getInformationInCelsiusFromCity: (NSString *) city completionHandler: (getCityInfo) completion {
    [self getInformationFromCity: city units: defaultUnitsValue completionHandler: completion];
}

@end
