//
//  NWAStationFetcher.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACity.h"
@protocol NWAStationFetcher <NSObject>


-(void)loadAllStationsForCity:(NWACity*)city
                   Completion:(ArrayCompletionBlock)completion;

@end
