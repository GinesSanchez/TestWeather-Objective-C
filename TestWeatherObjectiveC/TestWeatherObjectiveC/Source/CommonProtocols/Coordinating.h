//
//  Coordinating.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Coordinating <NSObject>

@required
// Functions
-(void) start;
-(void) stop;

// Properties
@property (nonatomic, retain) UINavigationController *navigationController;

@end
