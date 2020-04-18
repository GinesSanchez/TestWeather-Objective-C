//
//  SecondaryViewProtocolContracts.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SecondaryViewModelDelegate <NSObject>

-(void) viewLoaded;
-(void) goBackButtonTapped;

-(NSString *) goBackButtonTitle;

@end

@protocol SecondaryViewControllerDelegate <NSObject>

@end
