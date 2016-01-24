//
//  NWACitiesFetcher.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACountry.h"
#import "NWAWeathersAppBlock.h"

@protocol NWACitiesFetcher <NSObject>

-(void)loadAllCitiesForCountry:(NWACountry*)nWACountry
                    Completion:(ArrayCompletionBlock)completion;

@end
