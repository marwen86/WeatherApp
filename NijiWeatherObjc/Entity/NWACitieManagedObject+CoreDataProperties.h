//
//  NWACitieManagedObject+CoreDataProperties.h
//  
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NWACitieManagedObject.h"
#import "NWAStationManagedObject.h"
NS_ASSUME_NONNULL_BEGIN

@interface NWACitieManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *citieName;
@property (nullable, nonatomic, retain) NSString *citiesLong;
@property (nullable, nonatomic, retain) NSString *citiesALt;
@property (nullable, nonatomic, retain) NWACountryManagedObject *country;
@property (nullable, nonatomic, retain) NSOrderedSet<NWAStationManagedObject *> *stations;

@end

@interface NWACitieManagedObject (CoreDataGeneratedAccessors)

- (void)insertObject:(NWAStationManagedObject *)value inStationsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromStationsAtIndex:(NSUInteger)idx;
- (void)insertStations:(NSArray<NWAStationManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeStationsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInStationsAtIndex:(NSUInteger)idx withObject:(NWAStationManagedObject *)value;
- (void)replaceStationsAtIndexes:(NSIndexSet *)indexes withStations:(NSArray<NWAStationManagedObject *> *)values;
- (void)addStationsObject:(NWAStationManagedObject *)value;
- (void)removeStationsObject:(NWAStationManagedObject *)value;
- (void)addStations:(NSOrderedSet<NWAStationManagedObject *> *)values;
- (void)removeStations:(NSOrderedSet<NWAStationManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
