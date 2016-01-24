//
//  NijiWeatherAppManager.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWAAppManager.h"
#import "NWAWeathersAppBlock.h"
#import "NWANetWorkHelper.h"
#import <MagicalRecord/MagicalRecord.h>
#import <Mantle/Mantle.h>
#import "NWADataBaseHelper.h"
#import "NWACountry.h"
#import "NWACity.h"

@interface NWAAppManager ()

@property (nonatomic,strong) NWANetWorkHelper *nWANetWorkHelper;
@property (nonatomic,strong) NWADataBaseHelper *nWADataBaseHelper;



@end

@implementation NWAAppManager

+ (id)sharedManager {
    static NWAAppManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (NWANetWorkHelper *)nWANetWorkHelper
{
    if (_nWANetWorkHelper == nil) {
        _nWANetWorkHelper =[[NWANetWorkHelper alloc] init];
    }
    return _nWANetWorkHelper;
}
- (NWADataBaseHelper *)nWADataBaseHelper
{
    if (_nWADataBaseHelper == nil) {
        _nWADataBaseHelper =[[NWADataBaseHelper alloc] init];
    }
    return _nWADataBaseHelper;
}

-(void)loadAllCountiresCompletion:(ArrayCompletionBlock)completion;
{
    
     [[self nWADataBaseHelper] loadAllCountiresCompletion:^(NSArray *array, NSError *error) {
         if ([array count] > 0) {
             completion(array , nil);
         }else
         {
             [[self nWANetWorkHelper] loadAllCountiresCompletion:^(NSArray *array, NSError *error) {
                 if (!error) {
                     if (array) {
                        
                         //save data on database
                         [[self nWADataBaseHelper] StoreCountires:array];
                         completion(array,nil);
                     }
                 }
                 
             }];
         }
     }];
    
   
    

}

-(void)loadAllCitiesForCountry:(NWACountry*)nWACountry
                    Completion:(ArrayCompletionBlock)completion
{
    
    [[self nWADataBaseHelper] loadAllCitiesForCountry:nWACountry
                                           Completion:^(NSArray *array, NSError *error) {
        if ([array count] > 0) {
            completion(array , nil);
        }else
        {
            [[self nWANetWorkHelper] loadAllCitiesForCountry:nWACountry
                                                  Completion:^(NSArray *array, NSError *error) {
                if (!error) {
                    if (array) {
                        //save data on database
                        [[self nWADataBaseHelper] StoreCities:array
                                                 forCountries:nWACountry];
                        completion(array,nil);
                    }
                }
                
            }];
        }
    }];
    
}

-(void)loadAllStationsForCity:(NWACity*)city
                    Completion:(ArrayCompletionBlock)completion
{
    [[self nWADataBaseHelper] loadAllStationsForCity:city Completion:^(NSArray *array, NSError *error) {
        if (!error) {
            if ([array count]>0) {
                completion(array,nil);
            }  else
            {
                [[self nWANetWorkHelper] loadAllStationsForCity:city Completion:^(NSArray *array, NSError *error) {
                    if (!error) {
                        if ([array count]>0) {
                            [[self nWADataBaseHelper] StoreStation:array forCity:city];
                            completion(array,nil);
                        }
                    }
                }];
            }
        }
      
    }];
   
}



@end
