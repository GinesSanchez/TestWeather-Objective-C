//
//  CityInfo.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-16.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "CityInfo.h"

@implementation CityInfo

-(instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    NSDictionary * mainDictionary = dictionary[@"main"];

    if (self && mainDictionary ) {
        NSString *feelsLike = mainDictionary[@"feels_like"];
        NSNumber *humidity = mainDictionary[@"humidity"];
        NSNumber *currentTemp = mainDictionary[@"temp"];
        NSNumber *maxTemp = mainDictionary[@"temp_max"];
        NSNumber *minTemp = mainDictionary[@"temp_min"];

        if (feelsLike && humidity && currentTemp && maxTemp && minTemp) {
            self.feelsLike = feelsLike;
            self.humidity = humidity;
            self.currentTemp = currentTemp;
            self.maxTemp = maxTemp;
            self.minTemp = minTemp;
            return self;
        }
    }

    return nil;
}

@end
