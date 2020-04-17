//
//  MockNetworkManager.m
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "MockNetworkManager.h"

@implementation MockNetworkManager

- (NSURL *)createURLFromParameters:(NSDictionary *)parameters {
    return [NSURL new];
}

- (void)getJsonWith:(NSURL *)url completionHandler:(getJsonRequestBlock)completion {
    completion(self.customResponse, self.customError);
}

@end
