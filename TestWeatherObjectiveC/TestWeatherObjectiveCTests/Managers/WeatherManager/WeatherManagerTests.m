//
//  WeatherManagerTests.m
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherManager.h"
#import "MockNetworkManager.h"
#import "NSError+WeatherManager.h"

@interface WeatherManagerTests : XCTestCase

@end

@implementation WeatherManagerTests

WeatherManager *weatherManager;
MockNetworkManager *mockNetworkManager;

- (void)setUp {
    weatherManager = [WeatherManager new];
    mockNetworkManager = [MockNetworkManager new];
    weatherManager.networkManager = mockNetworkManager;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGetInformationFromCity_WithValidResponse_ReturnCityInfo {
    mockNetworkManager.customResponse = @{ @"main": @{
                                           @"feels_like": @"35.45",
                                           @"humidity": @66,
                                           @"pressure": @1013,
                                           @"temp": @32,
                                           @"temp_max": @32,
                                           @"temp_min": @32,
                                    }
    };
    mockNetworkManager.customError = nil;

    [weatherManager getInformationFromCity: @"Cartagena" units: @"imperial" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(cityInfo);
    }];
}

- (void)testGetInformationFromCity_WithUnkownErrorResponse_ReturnErrorCaseTypeUnknownError {
    mockNetworkManager.customResponse = nil;
    mockNetworkManager.customError = [NSError new];

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeUnknownError);

    }];
}

- (void)testGetInformationFromCity_WithNoResponse_ReturnErrorCaseTypeUnknownError {
    mockNetworkManager.customResponse = nil;
    mockNetworkManager.customError = nil;

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeUnknownError);

    }];
}


- (void)testGetInformationFromCity_WithNoInternetErrorResponse_ReturnErrorCaseTypeNoInternetConnection {
    mockNetworkManager.customResponse = nil;
    mockNetworkManager.customError = [NSError errorWithDomain:@"test.domain.ccom" code:-1009 userInfo:nil];

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeNoInternetConnection);

    }];
}

- (void)testGetInformationFromCity_WithInvalidApiKeyApiErrorResponse_ReturnErrorCaseTypeInvalidApiKey {
    mockNetworkManager.customResponse = @{ @"cod": @401,
                                           @"message": @"No error message"
    };
    mockNetworkManager.customError = nil;

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeInvalidApiKey);

    }];
}

- (void)testGetInformationFromCity_WithInternalErrorApiErrorResponse_ReturnErrorCaseTypeInternalError {
    mockNetworkManager.customResponse = @{ @"cod": @404,
                                           @"message": @"Internal error"
    };
    mockNetworkManager.customError = nil;

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeInternalError);

    }];
}

- (void)testGetInformationFromCity_WithCityNotFoundApiErrorResponse_ReturnErrorCaseTypeCityNotFound {
    mockNetworkManager.customResponse = @{ @"cod": @404,
                                           @"message": @"city not found"
    };
    mockNetworkManager.customError = nil;

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeCityNotFound);

    }];
}

- (void)testGetInformationFromCity_WithUnknownMessageApiErrorResponse_ReturnErrorCaseTypeUnknownApiError {
    mockNetworkManager.customResponse = @{ @"cod": @404,
                                           @"message": @"Unknow api message"
    };
    mockNetworkManager.customError = nil;

    [weatherManager getInformationInCelsiusFromCity: @"Cartagena" completionHandler: ^(CityInfo *cityInfo, NSError *error) {
        XCTAssertNil(cityInfo);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ErrorCaseTypeUnknownApiError);

    }];
}


@end
