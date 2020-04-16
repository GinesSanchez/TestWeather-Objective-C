//
//  CityInfo.h
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityInfo: NSObject

@property (nonatomic) NSString *feelsLike;
@property (nonatomic) NSNumber *humidity;
@property (nonatomic) NSNumber *currentTemp;
@property (nonatomic) NSNumber *maxTemp;
@property (nonatomic) NSNumber *minTemp;
@property (nonatomic) NSString *weatherDescription;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end
