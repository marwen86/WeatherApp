//
//  NWAStationManagedObject+CoreDataProperties.h
//  
//
//  Created by Mohamed Marouane YOUSSEF on 22/01/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NWAStationManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface NWAStationManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *temp;
@property (nullable, nonatomic, retain) NSNumber *pressure;
@property (nullable, nonatomic, retain) NSNumber *humidity;
@property (nullable, nonatomic, retain) NWACitieManagedObject *citie;

@end

NS_ASSUME_NONNULL_END
