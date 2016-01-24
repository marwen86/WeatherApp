//
//  NWANetworkhelper.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "NWANetWorkHelper.h"
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>
#import "NWACountry.h"
#import "NWACity.h"

@implementation NWANetWorkHelper

-(void)loadAllCountiresCompletion:(ArrayCompletionBlock)completion
{
   
    
    NSURL *URL = [NSURL URLWithString:@"http://api.geonames.org/countryInfoJSON?username=WeatherApp"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
         NSArray *responseArray =  [responseObject objectForKey:@"geonames"];
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(@"NWACountry")];
        NSArray *collection = [valueTransformer transformedValue:responseArray];
        
        completion(collection,nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
    
}

-(void)loadAllCitiesForCountry:(NWACountry *)nWACountry
                    Completion:(ArrayCompletionBlock)completion
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geonames.org/searchJSON?country=%@&username=WeatherApp",nWACountry.countryCode]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *responseArray =  [responseObject objectForKey:@"geonames"];
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(@"NWACity")];
        NSArray *collection = [valueTransformer transformedValue:responseArray];
        
        completion(collection,nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

-(void)loadAllStationsForCity:(NWACity*)city
                   Completion:(ArrayCompletionBlock)completion
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/find?lat=%.2f&lon=%.2f&appid=c258336f47350d8615f297197cba993a",[city.citiesALt floatValue],[city.citiesLong floatValue]]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *responseArray =  [responseObject objectForKey:@"list"];
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(@"NWAStation")];
        NSArray *collection = [valueTransformer transformedValue:responseArray];
        
        completion(collection,nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];


}
@end
