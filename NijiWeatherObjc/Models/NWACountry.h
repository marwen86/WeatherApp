//
//  NWACountry.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//
#import <Mantle/Mantle.h>

@interface NWACountry : MTLModel <MTLJSONSerializing,MTLManagedObjectSerializing>
@property(nonatomic,strong) NSString *countryName;
@property(nonatomic,strong) NSString *countryCode;
@end
