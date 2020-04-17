//
//  AppContext.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "AppContext.h"

@implementation AppContext

@synthesize navigationController;
@synthesize moduleFactory;

+(instancetype) appContext {
    AppContext *appContext = [AppContext new];
    appContext.navigationController = [UINavigationController new];
    appContext.moduleFactory = [ModuleFactory new];
    return appContext;
}

@end
