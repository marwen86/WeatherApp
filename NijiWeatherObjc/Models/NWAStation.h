//
//  NWAStation.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface NWAStation : MTLModel <MTLJSONSerializing,MTLManagedObjectSerializing>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSNumber *temp;
@property (nonatomic, copy, readonly) NSNumber *pressure;
@property (nonatomic, copy, readonly) NSNumber *humidity;

@end
