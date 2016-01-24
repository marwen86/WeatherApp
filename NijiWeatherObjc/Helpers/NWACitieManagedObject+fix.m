//
//  NWACitieManagedObject+fix.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWACitieManagedObject+fix.h"

@implementation NWACitieManagedObject (fix)

- (void)addStationsObject:(NSManagedObject *)value{
    
    [self willChangeValueForKey:@"stations"];
    NSMutableOrderedSet *tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.stations];
    [tempSet addObject: value];
    self.stations = tempSet;
    [self didChangeValueForKey:@"stations"];
    
}
@end
