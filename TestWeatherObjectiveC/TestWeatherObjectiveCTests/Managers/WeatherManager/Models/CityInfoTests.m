//
//  CityInfoTests.m
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CityInfo.h"

@interface CityInfoTests : XCTestCase

@end

@implementation CityInfoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCityInfo_InitWithDictionary_Success {
    NSDictionary *dictionary =  @{ @"main": @{
                                           @"feels_like": @"35.45",
                                           @"humidity": @66,
                                           @"pressure": @1013,
                                           @"temp": @32,
                                           @"temp_max": @32,
                                           @"temp_min": @32,
                                    }
    };


    CityInfo *cityInfo = [[CityInfo alloc] initWithDictionary: dictionary];

    XCTAssertNotNil(cityInfo);
    XCTAssertTrue([@"35.45" isEqualToString: cityInfo.feelsLike]);
    XCTAssertTrue([@66 isEqualToNumber: cityInfo.humidity]);
    XCTAssertTrue([@32 isEqualToNumber: cityInfo.currentTemp]);
    XCTAssertTrue([@32 isEqualToNumber:  cityInfo.maxTemp]);
    XCTAssertTrue([@32 isEqualToNumber:  cityInfo.minTemp]);
}

- (void)testCityInfo_InitWithDictionary_Fail {

    NSDictionary *dictionary =  @{ @"main": @{
                                           @"feels_like": @"35.45",
                                           @"humidity": @66 }};

    CityInfo *cityInfo = [[CityInfo alloc] initWithDictionary: dictionary];
    XCTAssertNil(cityInfo);
}


@end
