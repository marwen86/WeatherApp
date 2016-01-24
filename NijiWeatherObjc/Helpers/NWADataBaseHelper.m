//
//  NWADataBaseHelper.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWADataBaseHelper.h"
#import <MagicalRecord/MagicalRecord.h>
#import <Mantle/Mantle.h>
#import "NWAWeathersAppBlock.h"
#import "NWACountryManagedObject.h"
#import "NWACountry.h"
#import "NWACitieManagedObject.h"
#import "NWAStationManagedObject.h"
#import "NWACountryManagedObject+fix.h"
#import "NWACitieManagedObject+fix.h"
#import "NWACity.h"
#import "NWAStation.h"
@implementation NWADataBaseHelper


-(void)StoreCountires:(NSArray *)countries;
{

    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        [countries enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error;
            [MTLManagedObjectAdapter managedObjectFromModel:obj
                                       insertingIntoContext:localContext
                                                      error:&error];
        }];
    }];
}

-(void)StoreCities:(NSArray *)cities
      forCountries:(NWACountry *)NWACountry{

   
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        
         NWACountryManagedObject *nWACountryManagedObject = [self getCountryManagedObjectWithCountryCode:NWACountry.countryCode inContext:localContext];
        
        [cities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
             NSError *error;
            NWACitieManagedObject *nWACitieManagedObject=[MTLManagedObjectAdapter managedObjectFromModel:obj
                                       insertingIntoContext:localContext
                                                      error:&error];
            
            [nWACitieManagedObject setCountry:nWACountryManagedObject];
            
            [nWACountryManagedObject addCitiesObject:nWACitieManagedObject];
        
            
            
        }];
    }];
}

-(void)StoreStation:(NSArray *)stations
            forCity:(NWACity *)city{
    
    
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        
        NWACitieManagedObject *nWACitieManagedObject = [self getCityManagedObjectWithName:city.citieName inContext:localContext];
        
        [stations enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSError *error;
            NWAStationManagedObject *nWAStationManagedObject=[MTLManagedObjectAdapter managedObjectFromModel:obj
                                                                                    insertingIntoContext:localContext
                                                                                                   error:&error];
            
            [nWAStationManagedObject setCitie:nWACitieManagedObject];
            
            [nWACitieManagedObject addStationsObject:nWAStationManagedObject];
            
            
            
        }];
    }];
}

-(void)loadAllCountiresCompletion:(ArrayCompletionBlock)completion
{
    NSArray *countries = [NWACountryManagedObject MR_findAllSortedBy:@"countryName" ascending:YES];
    NSMutableArray *countriesModel=[[NSMutableArray alloc]init];
    for (NSManagedObject *object in countries) {
        //convert object from NSManagedObject to model Object
        [countriesModel addObject:[MTLManagedObjectAdapter modelOfClass:NSClassFromString(@"NWACountry")
                                                      fromManagedObject:object
                                                                  error:nil]];
    }
    completion(countriesModel,nil);
    
}

-(void)loadAllCitiesForCountry:(NWACountry*)nWACountry
                    Completion:(ArrayCompletionBlock)completion
{
    NSPredicate *countryFilter = [NSPredicate predicateWithFormat:@"country.countryCode == %@", nWACountry.countryCode];
    NSArray *citiesCountries=[NWACitieManagedObject MR_findAllSortedBy:@"citieName" ascending:YES
                                                         withPredicate:countryFilter];
     NSMutableArray *citiesModel=[[NSMutableArray alloc]init];
    for (NSManagedObject *object in citiesCountries) {
        [citiesModel addObject:[MTLManagedObjectAdapter modelOfClass:NSClassFromString(@"NWACity") fromManagedObject:object error:nil]];
    }
    completion(citiesModel,nil);
    


}
-(void)loadAllStationsForCity:(NWACity*)city
                   Completion:(ArrayCompletionBlock)completion
{
  
    NSString *predicateString = [NSString stringWithFormat:@"citie.citieName ==\"%@\"", city.citieName];

    NSPredicate *cityFilter=[NSPredicate predicateWithFormat:predicateString];
    NSArray *listSations = [NWAStationManagedObject MR_findAllSortedBy:@"name" ascending:YES withPredicate:cityFilter];
    NSMutableArray *stationModel=[[NSMutableArray alloc]init];
    for (NSManagedObject *obj in listSations) {
        [stationModel addObject:[MTLManagedObjectAdapter modelOfClass:NSClassFromString(@"NWAStation")
                                                    fromManagedObject:obj
                                                                error:nil]];
                      
        }
    completion(stationModel,nil);

}


#pragma mark - Public Methods

- (NWACountryManagedObject *)getCountryManagedObjectWithCountryCode:(NSString *)countryCode
                                                       inContext:(NSManagedObjectContext *)context
{
    return [NWACountryManagedObject MR_findFirstByAttribute:@"countryCode"
                                               withValue:countryCode
                                               inContext:context];
}

- (NWACitieManagedObject *)getCityManagedObjectWithName:(NSString *)name
                                          inContext:(NSManagedObjectContext *)context
{
    return [NWACitieManagedObject MR_findFirstByAttribute:@"citieName"
                                            withValue:name
                                            inContext:context];
}
- (NWAStationManagedObject *)getStationManagedObjectWithName:(NSString *)name
                                              inContext:(NSManagedObjectContext *)context
{
    return [NWAStationManagedObject MR_findFirstByAttribute:@"name"
                                                withValue:name
                                                inContext:context];
}


@end
