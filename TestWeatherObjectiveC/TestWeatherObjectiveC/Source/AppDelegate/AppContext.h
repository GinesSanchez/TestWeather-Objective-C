//
//  AppContext.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModuleFactory.h"

@protocol AppContextType <NSObject>

@required
+(instancetype) appContext;

@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) ModuleFactory *moduleFactory;

@end

@interface AppContext: NSObject <AppContextType>

@end
