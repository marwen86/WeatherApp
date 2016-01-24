//
//  NWACity.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWACity.h"

@implementation NWACity

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{   
             @"citieName" : @"name",
             @"citiesLong" : @"lng",
             @"citiesALt" : @"lat"
             };
}
+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{
             @"citieName" : @"citieName",
             @"citiesLong" : @"citiesLong",
             @"citiesALt" : @"citiesALt"
             };
}

+ (NSString *)managedObjectEntityName
{
    return @"NWACitieManagedObject";
}
@end
