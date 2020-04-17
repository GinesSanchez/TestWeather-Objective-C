//
//  AppCoordinator.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinating.h"
#import "AppContext.h"

@protocol AppCoordinatorType <Coordinating>

@property (nonatomic) id<AppContextType> appContext;

+ (instancetype)appCoordinatorWithAppContext: (id<AppContextType>) appContext;

@end

@interface AppCoordinator: NSObject <AppCoordinatorType>

@end

