//
//  NSError+WeatherManagerTests.m
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSError+WeatherManager.h"

@interface NSError_WeatherManagerTests : XCTestCase

@end

@implementation NSError_WeatherManagerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testWeatherManagerError_CreateErrorCaseTypeUnknownError_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeUnknownError];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeUnknownError, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"Uknown Error from the request."]);
}

- (void)testWeatherManagerError_CreateErrorCaseTypeUnknownApiError_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeUnknownApiError];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeUnknownApiError, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"Unknown Api Error."]);
}

- (void)testWeatherManagerError_CreateErrorCaseTypeInvalidApiKey_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeInvalidApiKey];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeInvalidApiKey, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"Invalid API Key."]);
}

- (void)testWeatherManagerError_CreateErrorCaseTypeInternalError_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeInternalError];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeInternalError, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"Internal Error. E.g. wrong url call."]);
}

- (void)testWeatherManagerError_CreateErrorCaseTypeCityNotFound_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeCityNotFound];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeCityNotFound, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"City not found in the API data system."]);
}

- (void)testWeatherManagerError_CreateErrorCaseTypeNoInternetConnection_CorrectData {

    NSError *error = [NSError errorFromWeatherManagerErrorType: ErrorCaseTypeNoInternetConnection];

    XCTAssertNotNil(error);
    XCTAssertEqual(ErrorCaseTypeNoInternetConnection, error.code);
    XCTAssertTrue([error.userInfo[NSLocalizedDescriptionKey] isEqualToString: @"There is not internet connection."]);
}

@end
