//
//  NWADataBaseHelper.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACountriesFetcher.h"
#import "NWACoutriesStorage.h"
#import "NWACitiesFetcher.h"
#import "NWACitiesStorage.h"
#import "NWAStationStorage.h"
#import "NWAStationFetcher.h"

@interface NWADataBaseHelper : NSObject <NWACountriesFetcher,NWACoutriesStorage,NWACitiesStorage,NWACitiesFetcher,NWAStationStorage,NWAStationFetcher>

@end
