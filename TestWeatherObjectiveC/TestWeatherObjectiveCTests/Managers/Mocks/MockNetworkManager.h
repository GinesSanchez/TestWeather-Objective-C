//
//  MockNetworkManager.h
//  TestWeatherObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManagerType.h"

@interface MockNetworkManager : NSObject <NetworkManagerType>

@property (nonatomic) NSDictionary *customResponse;
@property (nonatomic) NSError *customError;

-(NSURL *) createURLFromParameters: (NSDictionary *) parameters;
-(void) getJsonWith: (NSURL *) url completionHandler: (getJsonRequestBlock) completion;

@end
