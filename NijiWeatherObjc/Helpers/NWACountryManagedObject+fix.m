//
//  NWACountryManagedObject+fix.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWACountryManagedObject+fix.h"

@implementation NWACountryManagedObject (fix)

- (void)addCitiesObject:(NWACitieManagedObject *)value{
    [self willChangeValueForKey:@"cities"];
    NSMutableOrderedSet *tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.cities];
    [tempSet addObject: value];
    self.cities = tempSet;
    [self didChangeValueForKey:@"cities"];
}
@end
