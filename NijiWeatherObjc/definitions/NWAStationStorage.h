//
//  NWAStationStorage.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACity.h"
@protocol NWAStationStorage <NSObject>

-(void)StoreStation:(NSArray *)stations
            forCity:(NWACity *)city;
@end
