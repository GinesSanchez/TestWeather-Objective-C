//
//  SecondaryViewController.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewProtocolContracts.h"

@interface SecondaryViewController : UIViewController <SecondaryViewControllerDelegate>

@property (nonatomic) id <SecondaryViewModelDelegate> viewModel;

@end
