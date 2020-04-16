//
//  NetworkManager.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

//TODO: Move to specific Manager (enum)
NSString * const apiScheme = @"https";
NSString * const apiHost = @"api.openweathermap.org";
NSString * const apiPath = @"/data/2.5/weather/";

- (NSURL *)createURLFromParameters:(NSDictionary *)parameters {
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = apiScheme;
    components.host = apiHost;
    components.path = apiPath;

    if ([parameters count] > 0) {
        NSMutableArray *parametersArray = [NSMutableArray new];
        [parameters enumerateKeysAndObjectsUsingBlock: ^(NSString* key, NSString* value, BOOL * stop) {
            [parametersArray addObject: [NSURLQueryItem queryItemWithName: key value: value]];
        }];
        components.queryItems = parametersArray;
    }

    return components.URL;
}

- (void)getJsonWith:(NSURL *)url completionHandler:(getJsonRequestBlock)completion {
    //TODO:
}

@end
