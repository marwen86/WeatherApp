//
//  NijiWeatherAppManager.h
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
#import "NWAStationFetcher.h"
#import "NWAStationStorage.h"

@interface NWAAppManager : NSObject <NWACountriesFetcher,NWACoutriesStorage,NWACitiesFetcher,NWACitiesStorage,NWAStationFetcher,NWAStationStorage>

+ (id)sharedManager;
@end
