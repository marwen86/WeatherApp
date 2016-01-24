//
//  NWAStation.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWAStation.h"

@implementation NWAStation


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"name" : @"name",
             @"temp" : @"main.temp",
             @"pressure" : @"main.pressure",
              @"humidity" : @"main.humidity"
             };
}
+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{
             @"name" : @"name",
             @"temp" : @"temp",
             @"pressure" : @"pressure",
             @"humidity" : @"humidity"
             };
}

+ (NSString *)managedObjectEntityName
{
    return @"NWAStationManagedObject";
}

@end
