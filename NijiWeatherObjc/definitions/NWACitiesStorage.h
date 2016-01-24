//
//  NWACitiesStorage.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWACountry.h"

@protocol NWACitiesStorage <NSObject>

-(void)StoreCities:(NSArray *)cities
      forCountries:(NWACountry *)NWACountry;

@end
