//
//  NWACountry.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWACountry.h"

@implementation NWACountry


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"countryName" : @"countryName",
             @"countryCode" : @"countryCode"
             };
}
+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{
             @"countryName" : @"countryName",
             @"countryCode" : @"countryCode"
             };
}

+ (NSString *)managedObjectEntityName
{
    return @"NWACountryManagedObject";
}


@end
