//
//  NWANetworkhelper.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACountriesFetcher.h"
#import "NWACitiesFetcher.h"
#import "NWAStationFetcher.h"

@interface NWANetWorkHelper : NSObject <NWACountriesFetcher,NWACitiesFetcher,NWAStationFetcher>


@end
