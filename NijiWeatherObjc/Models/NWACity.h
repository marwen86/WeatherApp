//
//  NWACity.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface NWACity : MTLModel <MTLJSONSerializing,MTLManagedObjectSerializing>

@property (nonatomic, retain) NSString *citieName;
@property (nonatomic, retain) NSString *citiesLong;
@property (nonatomic, retain) NSString *citiesALt;


@end
