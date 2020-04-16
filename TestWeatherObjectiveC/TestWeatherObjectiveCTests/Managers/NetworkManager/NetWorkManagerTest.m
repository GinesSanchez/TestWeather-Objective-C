//
//  NetWorkManagerTest.m
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetWorkManager.h"

@interface NetWorkManagerTest : XCTestCase

@end

@implementation NetWorkManagerTest

NetworkManager * networkManager;

- (void)setUp {
    networkManager = [NetworkManager new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testNetworkManager_CreateURLWithoutParameters_Success {
    NSURL *url = [networkManager createURLFromParameters: nil];
    XCTAssertTrue([url.absoluteString isEqualToString: @"https://api.openweathermap.org/data/2.5/weather/"]);
    XCTAssertNil(url.query);
}

- (void)testNetworkManager_CreateURLWithParameters_Success {
    NSURL *url = [networkManager createURLFromParameters: @{ @"q": @"Cartagena",
                                                             @"units": @"metric"}];

    XCTAssertTrue([url.absoluteString isEqualToString: @"https://api.openweathermap.org/data/2.5/weather/?q=Cartagena&units=metric"]);
    XCTAssertNotNil(url.query);
    XCTAssertTrue([url.query isEqualToString: @"q=Cartagena&units=metric"]);
}

- (void)testNetworkManager_getJSON_Success {
    NSURL *url = [networkManager createURLFromParameters: @{ @"q": @"Cartagena",
                                                             @"APPID": @"13707c65904c020b88624e021a64524d",
                                                             @"units": @"metric"}];

    XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];

    [networkManager getJsonWith: url completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(response);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout: 2.0 handler:nil];

}

- (void)testNetworkManager_getJSON_Fail {
    //TODO: URL as parameter for create URL
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = @"https";
    components.host = @"www.as.com";
    NSURL *url = components.URL;

    XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];

    [networkManager getJsonWith: url completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNotNil(error);
        XCTAssertNil(response);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout: 2.0 handler:nil];
}


@end
