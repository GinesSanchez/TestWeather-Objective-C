//
//  NetworkManager.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManagerType.h"

@interface NetworkManager: NSObject <NetworkManagerType>

-(NSURL *) createURLFromParameters: (NSDictionary *) parameters;
-(void) getJsonWith: (NSURL *) url completionHandler: (getJsonRequestBlock) completion;

@end
