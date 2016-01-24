//
//  NWACountryManagedObject+CoreDataProperties.h
//  
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NWACountryManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface NWACountryManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *countryName;
@property (nullable, nonatomic, retain) NSString *countryCode;
@property (nullable, nonatomic, retain) NSOrderedSet<NWACitieManagedObject *> *cities;

@end

@interface NWACountryManagedObject (CoreDataGeneratedAccessors)

- (void)insertObject:(NWACitieManagedObject *)value inCitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCitiesAtIndex:(NSUInteger)idx;
- (void)insertCities:(NSArray<NWACitieManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCitiesAtIndex:(NSUInteger)idx withObject:(NWACitieManagedObject *)value;
- (void)replaceCitiesAtIndexes:(NSIndexSet *)indexes withCities:(NSArray<NWACitieManagedObject *> *)values;
- (void)addCitiesObject:(NWACitieManagedObject *)value;
- (void)removeCitiesObject:(NWACitieManagedObject *)value;
- (void)addCities:(NSOrderedSet<NWACitieManagedObject *> *)values;
- (void)removeCities:(NSOrderedSet<NWACitieManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
