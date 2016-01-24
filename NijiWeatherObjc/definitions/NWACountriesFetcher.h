//
//  CountriesFetcher.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWAWeathersAppBlock.h"

@protocol NWACountriesFetcher <NSObject>

-(void)loadAllCountiresCompletion:(ArrayCompletionBlock)completion;

@end
