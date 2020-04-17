//
//  NetworkManagerType.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompletionHandlerTypeDefs.h"

@protocol NetworkManagerType <NSObject>

/// Retrives a URL
///
/// - Parameter parameters: dictionary with parameters [key: value]
/// - Returns: URL
-(NSURL *) createURLFromParameters: (NSDictionary *) parameters;

/// Get json from URL
///
/// - Parameter
///     - url: url for the get request.
///     - completionHandler: will be triggred when the request is done. If it is successfull, the json in a dictionary format is returned. Error will be nil if successful. If there is an error, and error is returned, and dictionary will be nil.

-(void) getJsonWith: (NSURL *) url completionHandler: (getJsonRequestBlock) completion;

//func getJson(with url: URL, completionHandler: @escaping ([String: Any]?, Error?) -> Void)

@end
