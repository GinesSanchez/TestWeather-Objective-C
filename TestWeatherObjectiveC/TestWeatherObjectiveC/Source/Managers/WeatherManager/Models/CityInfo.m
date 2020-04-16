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
    NSDictionary * weatherDictionary = dictionary[@"weather"];

    if (self && mainDictionary && weatherDictionary) {
        NSString *feelsLike = mainDictionary[@"feels_like"];
        NSString *humidity = mainDictionary[@"humidity"];
        NSString *currentTemp = mainDictionary[@"temp"];
        NSString *maxTemp = mainDictionary[@"temp_max"];
        NSString *minTemp = mainDictionary[@"temp_min"];
        NSString *description = weatherDictionary[@"description"];

        if (feelsLike && humidity && currentTemp && maxTemp && minTemp && description) {
            self.feelsLike = feelsLike;
            self.humidity = humidity;
            self.currentTemp = currentTemp;
            self.maxTemp = maxTemp;
            self.minTemp = minTemp;
            self.weatherDescription = description;
            return self;
        }
    }

    return nil;
}

@end
