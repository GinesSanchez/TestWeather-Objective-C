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

@end
