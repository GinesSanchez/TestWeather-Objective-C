//
//  SecondaryViewModel.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondaryViewProtocolContracts.h"

@protocol SecondaryViewModelType <NSObject>

@property (nonatomic, weak) id <SecondaryViewControllerDelegate> viewController;

-(instancetype) initWithViewControllerDelegate: (id <SecondaryViewControllerDelegate>) viewController;

@end

@interface SecondaryViewModel: NSObject <SecondaryViewModelType, SecondaryViewModelDelegate>

@end

