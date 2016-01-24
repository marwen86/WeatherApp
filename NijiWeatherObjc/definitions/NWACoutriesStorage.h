//
//  NWACoutriesStorage.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NWACoutriesStorage <NSObject>

-(void)StoreCountires:(NSArray *)countries;

@end
