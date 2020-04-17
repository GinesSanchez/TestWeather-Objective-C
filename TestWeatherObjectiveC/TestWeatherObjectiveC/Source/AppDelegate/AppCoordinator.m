//
//  AppCoordinator.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "AppCoordinator.h"

@implementation AppCoordinator

@synthesize appContext;
@synthesize navigationController;

+ (instancetype)appCoordinatorWithAppContext:(id<AppContextType>) appContext { 
    AppCoordinator *appCoordinator = [AppCoordinator new];
    appCoordinator.navigationController = appContext.navigationController;
    appCoordinator.appContext = appContext;
    return appCoordinator;
}

- (void)start {
    //TODO:
}

- (void)stop {
    //TODO:
}

@end
